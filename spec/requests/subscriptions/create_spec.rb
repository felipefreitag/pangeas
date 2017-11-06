# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'POST /subscriptions/create', type: :request do
  subject { response }

  let!(:user) do
    User.create!(
      first_name: 'jane',
      last_name: 'doe',
      email: 'bar@baz.com',
      password: '123456',
      iugu_id: '1'
    )
  end

  context 'when api payment method fails' do
    before do
      stub_request_payment(500)
      sign_in user
      post '/subscriptions'
    end

    it { is_expected.to redirect_to(root_path) }
    it 'shows an error message' do
      expect(flash[:failure]).to be_present
    end
  end

  context 'when api subscription fails' do
    before do
      stub_request_payment(200)
      stub_request_subscription(status: 500)
      sign_in user
      post '/subscriptions', params: { subscription: { recurrence: 'monthly' } }
    end

    it { is_expected.to redirect_to(root_path) }
    it 'shows an error message' do
      expect(flash[:failure]).to be_present
    end
  end

  context 'when subscription is created' do
    before do
      stub_request_payment(200)
      stub_request_subscription(status: 200, body: { id: '1' }.to_json)
      sign_in user
      post '/subscriptions', params: { subscription: { recurrence: 'monthly' } }
    end

    it { is_expected.to redirect_to(user.subscription) }
  end
end

def stub_request_payment(status)
  stub_request(:post, "#{base_url}/customers/1/payment_methods")
    .with(
      body: {
        description: 'Cartão de crédito',
        set_as_default: true,
        customer_id: user.iugu_id,
        token: nil
      }.to_json,
      headers: headers
    ).to_return(status: status)
end

def stub_request_subscription(to_return)
  stub_request(:post, "#{base_url}/subscriptions")
    .with(
      body: {
        credits_based: false,
        plan_identifier: 'monthly',
        customer_id: user.iugu_id
      }.to_json,
      headers: headers
    ).to_return(to_return)
end

def base_url
  'https://api.iugu.com/v1'
end

def headers
  {
    'Accept' => 'application/json',
    'Authorization' => /Basic .+/,
    'Content-Type' => 'application/json',
    'Host' => 'api.iugu.com:443'
  }
end
