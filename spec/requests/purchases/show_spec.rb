# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /purchases/:id', type: :request do
  subject { response }

  let(:purchase) do
    Purchase.create!(
      user: user, course: course, price: course.price, installments: '1'
    )
  end

  let!(:user) do
    User.create!(
      first_name: 'jane',
      last_name: 'doe',
      email: 'bar@baz.com',
      password: '123456',
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

  context 'without a logged in user' do
    before do
      get "/purchases/#{purchase.id}", params: { course: course.id }
    end

    it { is_expected.to have_http_status(:found) }
  end

  context 'with logged in user' do
    context 'that is the owner' do
      before do
        sign_in user
        get "/purchases/#{purchase.id}"
      end

      it { is_expected.to have_http_status(:ok) }
    end

    context 'that is not the owner' do
      let(:user2) do
        User.create!(
          first_name: 'john',
          last_name: 'doe',
          email: 'foo@baz.com',
          password: '123456',
          cpf: '1234567890',
          address: 'foo',
          address_number: '42',
          zip_code: '123',
          city: 'foo',
          state: 'foo'
        )
      end

      before do
        sign_in user2
        get "/purchases/#{purchase.id}"
      end

      it { is_expected.to have_http_status(:found) }
    end

    context 'that is admin' do
      let(:user2) do
        User.create!(
          first_name: 'john',
          last_name: 'doe',
          email: 'foo@baz.com',
          password: '123456',
          cpf: '1234567890',
          admin: true,
          address: 'foo',
          address_number: '42',
          zip_code: '123',
          city: 'foo',
          state: 'foo'
        )
      end

      before do
        sign_in user2
        get "/purchases/#{purchase.id}"
      end

      it { is_expected.to have_http_status(:ok) }
    end
  end
end
