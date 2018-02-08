# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /users/:id', type: :request do
  subject { response }

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

  context 'without logged in user' do
    before do
      get "/users/#{user[:id]}"
    end

    it { is_expected.to redirect_to(new_user_registration_path) }
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
        get "/users/#{user[:id]}"
      end

      it { is_expected.to redirect_to(root_path) }
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
        get "/users/#{user[:id]}"
      end

      it { is_expected.to have_http_status(:ok) }
    end
  end
end
