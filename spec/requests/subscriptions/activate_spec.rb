# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'POST /subscriptions/activate', type: :request do
  subject { response }

  let!(:user) do
    User.create!(
      first_name: 'jane',
      last_name: 'doe',
      email: 'bar@baz.com',
      password: '123456',
      cpf: '1234567890',
      iugu_id: '1',
      address: 'foo',
      address_number: '42',
      zip_code: '123',
      city: 'foo',
      state: 'foo',
      country: 'foo',
      phone: '123456'
    )
  end

  let!(:subscription) do
    Subscription.create!(user: user, recurrence: 'monthly', iugu_id: '1')
  end

  context 'with valid subscription iugu_id' do
    before do
      post '/subscriptions/activate', params: { data: { id: '1' } }
    end

    it { is_expected.to have_http_status(204) }

    it 'activates the subscription' do
      expect(subscription.reload.state).to eq('active')
    end

    it 'updates the activated_at attribute' do
      expect(subscription.reload.activated_at).not_to be(nil)
    end
  end
end
