# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Purchase, type: :model do
  subject(:purchase) do
    Purchase.new(
      user: user,
      course: course,
      price: course.price,
      installments: 1
    )
  end

  let(:user) do
    User.create!(
      email: 'foo@bar.com',
      first_name: 'Foo',
      last_name: 'Bar',
      password: 'foobarfoo',
      cpf: '1234567890',
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

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:course) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:course) }
    it { is_expected.to validate_presence_of(:installments) }
  end

  describe 'pay' do
    before do
      purchase.pay('123')
    end

    it 'pays the purchase' do
      expect(purchase.paid).to be(true)
    end

    it 'saves the invoice_id' do
      expect(purchase.invoice_id).to eq('123')
    end
  end
end
