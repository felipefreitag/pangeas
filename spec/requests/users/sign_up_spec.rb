# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /users/sign_up', type: :request do
  subject { response }

  context 'when user signs up' do
    before do
      post user_registration_path, params: {
        user: {
          first_name: 'foo',
          last_name: 'bar',
          email: 'foo@bar.com',
          password: '123456'
        }
      }
    end

    it { is_expected.to redirect_to(new_payment_path) }
  end
end
