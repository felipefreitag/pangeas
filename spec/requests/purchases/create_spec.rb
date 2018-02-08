# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'POST /purchases/create', type: :request do
  subject { response }

  let!(:user) do
    User.create!(
      first_name: 'jane',
      last_name: 'doe',
      email: 'bar@baz.com',
      password: '123456',
      cpf: '1234567890',
      iugu_id: '1',
      address: 'foo',
      address_number: '42',
      zip_code: '123',
      city: 'foo',
      state: 'foo'
    )
  end

  let(:course) do
    Course.create!(
      name: 'baz course',
      description: 'some course description',
      lesson_detail: 'foo',
      subsection: subsection,
      vimeo_id: '1234',
      image_url: 'http://foo',
      instructor: 'foo',
      credentials: 'foo',
      price: '1000',
      discount_price: '900'
    )
  end

  let!(:section) do
    Section.create!(
      name: 'foo section',
      description: 'some section description',
      image_url: 'http://image-url'
    )
  end

  let!(:subsection) do
    Subsection.create!(
      name: 'bar subsection',
      section: section
    )
  end

  context 'without current user' do
    before do
      post purchases_path
    end

    it { is_expected.to redirect_to(new_user_registration_path) }
    it 'shows a message' do
      expect(flash[:info]).to be_present
    end
  end

  context 'when api call fails' do
    before do
      stub_charge_request(status: 500)
      sign_in user
      post purchases_path, params: {
        purchase: { installments: '1', course: course.id }
      }
    end

    it { is_expected.to redirect_to(course_path(course)) }
    it 'shows an error message' do
      expect(flash[:failure]).to be_present
    end
  end

  context 'when credit card charge fails' do
    before do
      stub_charge_request(
        status: 200, body: { invoice_id: '1', success: false }.to_json
      )
      sign_in user
      post purchases_path, params: {
        purchase: { installments: '1', course: course.id }
      }
    end

    it { is_expected.to redirect_to(course_path(course)) }
    it 'shows an error message' do
      expect(flash[:failure]).to be_present
    end
  end

  context 'when purchase is created' do
    context 'without an affiliate_tag' do
      before do
        stub_charge_request(
          status: 200, body: { invoice_id: '1', success: true }.to_json
        )
        sign_in user
        post purchases_path, params: {
          purchase: { installments: '1', course: course.id }
        }
      end

      subject(:purchase) { Purchase.first }

      it { is_expected.to redirect_to(purchase) }

      it { expect(purchase.user).to eq(user) }
      it { expect(purchase.course).to eq(course) }
      it { expect(purchase.price).to eq(course.price) }
      it { expect(purchase.installments).to eq('1') }
      it { expect(purchase.paid).to be(true) }
      it { expect(purchase.affiliate_tag).to be(nil) }
      it { expect(purchase.invoice_id).to eq('1') }
    end

    context 'with an affiliate_tag' do
      before do
        stub_charge_request(
          status: 200, body: { invoice_id: '1', success: true }.to_json
        )
        sign_in user
        get root_path, params: { aff: 'aff123' }
        post purchases_path, params: {
          purchase: { installments: '1', course: course.id }
        }
      end

      subject(:purchase) { Purchase.first }

      it { is_expected.to redirect_to(purchase) }

      it { expect(purchase.user).to eq(user) }
      it { expect(purchase.course).to eq(course) }
      it { expect(purchase.price).to eq(course.price) }
      it { expect(purchase.installments).to eq('1') }
      it { expect(purchase.paid).to be(true) }
      it { expect(purchase.affiliate_tag).to eq('aff123') }
      it { expect(purchase.invoice_id).to eq('1') }
    end
  end

  context 'when user has a subscription' do
    before do
      subscription = Subscription.create!(user: user, recurrence: 'monthly')
      subscription.activate!
      stub_charge_request(
        { status: 200, body: { invoice_id: '1', success: true }.to_json },
        "#{course.discount_price}00"
      )
      sign_in user
      post purchases_path, params: {
        purchase: { installments: '1', course: course.id }
      }
    end

    subject(:purchase) { Purchase.first }

    it { expect(purchase.price).to eq(course.discount_price) }
  end
end

def stub_charge_request(to_return, price = '100000')
  stub_request(:post, "#{base_url}/charge")
    .with(
      body: {
        token: nil,
        customer_id: user.iugu_id,
        months: 1,
        items: { description: course.name, quantity: 1, price_cents: price }
      }.to_json,
      headers: headers
    ).to_return(to_return)
end

def base_url
  'https://api.iugu.com/v1'
end

def headers
  {
    'Accept' => 'application/json',
    'Authorization' => /Basic .+/,
    'Content-Type' => 'application/json',
    'Host' => 'api.iugu.com:443'
  }
end
