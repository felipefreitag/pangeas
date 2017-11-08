# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /users/sign_up', type: :request do
  subject { response }

  context 'when user signs up' do
    let(:user) do
      {
        first_name: 'foo',
        last_name: 'bar',
        email: 'foo@bar.com',
        password: '123456'
      }
    end

    context 'without affiliate_tag' do
      before do
        post user_registration_path, params: { user: user }
      end

      it { is_expected.to redirect_to(new_payment_path) }

      subject(:user_first) { User.first }

      it { expect(user_first.first_name).to eq('foo') }
      it { expect(user_first.last_name).to eq('bar') }
      it { expect(user_first.email).to eq('foo@bar.com') }
      it { expect(user_first.affiliate_tag).to be(nil) }
    end

    context 'with affiliate_tag' do
      before do
        user['affiliate_tag'] = 'aff123'
        post user_registration_path, params: { user: user }
      end

      it { is_expected.to redirect_to(new_payment_path) }

      subject(:user_first) { User.first }

      it { expect(user_first.first_name).to eq('foo') }
      it { expect(user_first.last_name).to eq('bar') }
      it { expect(user_first.email).to eq('foo@bar.com') }
      it { expect(user_first.affiliate_tag).to eq('aff123') }
    end
  end
end
