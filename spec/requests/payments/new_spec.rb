# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /payments/new', type: :request do
  subject { response }

  context 'without logged in user' do
    before do
      stub_request(:post, 'https://api.iugu.com/v1/customers')
        .to_return(status: 200, body: '', headers: {})
      get '/payments/new'
    end

    it { is_expected.to redirect_to(new_user_session_path) }
  end

  context 'with logged in user' do
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
        state: 'foo',
        country: 'foo',
        phone: '123456'
      )
    end

    context 'with successful api request' do
      before do
        headers = {
          'Accept' => 'application/json',
          'Authorization' => /Basic .+/,
          'Content-Type' => 'application/json',
          'Host' => 'api.iugu.com:443'
        }
        stub_request(:post, 'https://api.iugu.com/v1/customers')
          .with(
            body: '{"email":"bar@baz.com","name":"jane doe"}',
            headers: headers
          )
          .to_return(
            status: 200,
            body: { id: 'bar' }.to_json,
            headers: {}
          )
        sign_in user
        get '/payments/new'
      end

      it { is_expected.to have_http_status(:ok) }
    end

    context 'with failed api request' do
      before do
        headers = {
          'Accept' => 'application/json',
          'Authorization' => /Basic .+/,
          'Content-Type' => 'application/json',
          'Host' => 'api.iugu.com:443'
        }
        stub_request(:post, 'https://api.iugu.com/v1/customers')
          .with(
            body: '{"email":"bar@baz.com","name":"jane doe"}',
            headers: headers
          )
          .to_return(
            status: 500,
            body: {}.to_json,
            headers: {}
          )
        sign_in user
        get '/payments/new'
      end

      it { is_expected.to redirect_to(root_path) }
      it 'shows an error message' do
        expect(flash[:failure]).to be_present
      end
    end
  end
end
