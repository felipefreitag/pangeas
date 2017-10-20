# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User sign-in', type: :request do
  subject { response }

  let!(:user) do
    User.create!(
      first_name: 'john',
      last_name: 'doe',
      email: 'foo@bar.com',
      password: '123456'
    )
  end

  context 'when user signs in' do
    before do
      post user_session_path \
        'user[email]': user.email,
        'user[password]': user.password
    end

    it 'redirects to sections/index' do
      is_expected.to redirect_to(sections_path)
    end
  end
end
