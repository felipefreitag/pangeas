# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /payments/new', type: :request do
  subject { response }

  context 'without logged user' do
    before do
      get '/payments/new'
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

    before do
      sign_in user
      get '/payments/new'
    end

    it { is_expected.to have_http_status(:ok) }
  end
end
