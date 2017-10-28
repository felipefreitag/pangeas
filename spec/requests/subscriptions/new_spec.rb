# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /subscriptions/new', type: :request do
  subject { response }

  before do
    get '/subscriptions/new'
  end

  it { is_expected.to have_http_status(:ok) }
end
