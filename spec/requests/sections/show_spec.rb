# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /sections/:id', type: :request do
  subject { response }

  let!(:section) do
    Section.create!(
      name: 'Vida em Equilíbrio',
      description: 'some section description',
      image_url: 'http://image-url'
    )
  end

  context 'without logged user' do
    before do
      get "/sections/#{section.id}"
    end

    it { is_expected.to have_http_status(:found) }
  end

  context 'with logged user' do
    let!(:user) do
      User.create!(
        first_name: 'john',
        last_name: 'doe',
        email: 'foo@bar.com',
        password: '123456',
        cpf: '1234567890',
        address: 'foo',
        address_number: '42',
        zip_code: '123',
        city: 'foo',
        state: 'foo',
        country: 'foo',
        phone: '123456'
      )
    end

    context 'without subscription' do
      before do
        sign_in user
        get "/sections/#{section.id}"
      end

      it { is_expected.to have_http_status(:found) }
    end

    context 'with subscription' do
      before do
        Subscription.create!(
          user: user,
          state: 'active',
          recurrence: 'monthly'
        )
        sign_in user
        get "/sections/#{section.id}"
      end

      it { is_expected.to have_http_status(:ok) }
      it { is_expected.to render_template(:show) }
    end
  end
end
