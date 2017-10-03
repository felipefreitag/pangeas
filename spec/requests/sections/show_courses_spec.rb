# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Show Courses section', type: :request do
  subject { response }

  let!(:section) do
    Section.create!(
      name: 'Cursos Pangeas',
      description: 'some section description',
      image_url: 'http://image-url'
    )
  end

  describe 'GET' do
    before do
      get "/sections/#{section.id}"
    end

    it 'Returns ok' do
      expect(subject).to have_http_status(:ok)
    end

    it 'Renders the correct template' do
      expect(subject).to render_template(:show_courses)
    end
  end
end
