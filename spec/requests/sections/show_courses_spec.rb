require 'rails_helper'

RSpec.describe "Show Courses section", type: :request do
  subject { response }

  let!(:section) {
    Section.create!(
      name: 'Cursos Pangeas',
      description: 'some section description',
      image_url: 'http://image-url'
    )
  }

  describe "GET" do
    before do
      get "/sections/#{section.id}"
    end

    it "Returns ok" do
      expect(subject).to have_http_status(:ok)
    end
  end
end
