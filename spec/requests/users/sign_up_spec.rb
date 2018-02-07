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
        password: '123456',
        cpf: '1234567890',
        address: 'foo',
        address_number: '42',
        zip_code: '123',
        city: 'foo',
        state: 'foo'
      }
    end

    context 'without a previous path' do
      before do
        post user_registration_path, params: { user: user }
      end

      it { is_expected.to redirect_to(root_path) }
    end

    context 'with a previous path' do
      before do
        get new_payment_path
        post user_registration_path, params: { user: user }
      end

      it { is_expected.to redirect_to(new_payment_path) }
    end

    context 'without affiliate_tag' do
      before do
        post user_registration_path, params: { user: user }
      end

      it { is_expected.to redirect_to(root_path) }

      subject(:first_user) { User.first }

      it { expect(first_user.first_name).to eq('foo') }
      it { expect(first_user.last_name).to eq('bar') }
      it { expect(first_user.email).to eq('foo@bar.com') }
      it { expect(first_user.affiliate_tag).to be(nil) }
    end

    context 'with affiliate_tag' do
      before do
        user['affiliate_tag'] = 'aff123'
        post user_registration_path, params: { user: user }
      end

      it { is_expected.to redirect_to(root_path) }

      subject(:first_user) { User.first }

      it { expect(first_user.first_name).to eq('foo') }
      it { expect(first_user.last_name).to eq('bar') }
      it { expect(first_user.email).to eq('foo@bar.com') }
      it { expect(first_user.affiliate_tag).to eq('aff123') }
    end
  end
end
