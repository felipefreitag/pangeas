# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /users/sign_in', type: :request do
  subject { response }

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

  context 'when user signs in' do
    before do
      post user_session_path, params: {
        'user[email]': user.email,
        'user[password]': user.password
      }
    end

    it { is_expected.to redirect_to(sections_path) }
  end
end
