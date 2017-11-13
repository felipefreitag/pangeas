# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /users/:id', type: :request do
  subject { response }

  let!(:user) do
    User.create!(
      first_name: 'jane',
      last_name: 'doe',
      email: 'bar@baz.com',
      password: '123456'
    )
  end

  context 'without logged in user' do
    before do
      get "/users/#{user[:id]}"
    end

    it { is_expected.to redirect_to(new_user_session_path) }
  end

  context 'with logged in user' do
    context 'that is the owner' do
      before do
        sign_in user
        get "/users/#{user[:id]}"
      end

      it { is_expected.to have_http_status(:ok) }
    end

    context 'that is not the owner' do
      let(:user2) do
        User.create!(
          first_name: 'john',
          last_name: 'doe',
          email: 'foo@baz.com',
          password: '123456'
        )
      end

      before do
        sign_in user2
        get "/users/#{user[:id]}"
      end

      it { is_expected.to redirect_to(new_subscription_path) }
    end

    context 'that is admin' do
      let(:user2) do
        User.create!(
          first_name: 'john',
          last_name: 'doe',
          email: 'foo@baz.com',
          password: '123456',
          admin: true
        )
      end

      before do
        sign_in user2
        get "/users/#{user[:id]}"
      end

      it { is_expected.to have_http_status(:ok) }
    end
  end
end
