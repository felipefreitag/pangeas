# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Sections index", type: :request do
  subject { response }

  describe "GET" do
    before do
      get "/sections"
    end

    it "Returns ok" do
      expect(subject).to have_http_status(:ok)
    end
  end
end
