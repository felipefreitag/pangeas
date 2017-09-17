require 'rails_helper'

RSpec.describe "Show video", type: :request do
  subject { response }

  let!(:video) {
    Video.create!(
      name: "foo",
      description: "description Praesent venenatis justo ut venenatis consectetur.
        In mauris nisi, pellentesque quis elementum eu, feugiat eget magna.
        Maecenas ultrices sit amet libero sed hendrerit. Quisque",
      vimeo_id: "163721649",
    )
  }

  describe "GET" do
    before do
      get "/videos/#{video.id}"
    end

    it "Renders show video template" do
      expect(subject).to have_http_status(:ok)
    end
  end
end
