# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Subscription New', type: :request do
  subject { response }

  before do
    get '/subscriptions/new'
  end

  it 'returns ok' do
    is_expected.to have_http_status(:ok)
  end
end
