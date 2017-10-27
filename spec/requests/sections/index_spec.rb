# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /sections', type: :request do
  subject { response }

  before do
    Section.create!(
      name: 'foo section',
      description: 'some section description',
      image_url: 'http://image-url'
    )
  end

  context 'without logged user' do
    before do
      get '/sections'
    end

    it { is_expected.to have_http_status(:found) }
  end

  context 'with logged user' do
    let!(:user) do
      User.create!(
        first_name: 'jane',
        last_name: 'doe',
        email: 'bar@baz.com',
        password: '123456'
      )
    end

    context 'without subscription' do
      before do
        sign_in user
        get '/sections'
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
        get '/sections'
      end

      it { is_expected.to have_http_status(:ok) }
    end
  end
end
