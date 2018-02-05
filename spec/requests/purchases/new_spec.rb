# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /purchases/new', type: :request do
  subject { response }

  context 'without a logged in user' do
    before do
      get '/purchases/new'
    end

    it { is_expected.to have_http_status(:ok) }
  end
end
