# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /courses', type: :request do
  subject { response }

  let!(:section) do
    Section.create!(
      name: 'Cursos Pangeas',
      description: 'some section description',
      image_url: 'http://image-url'
    )
  end

  before do
    Subsection.create!(
      name: 'courses',
      section: section
    )
    get '/courses'
  end

  it { is_expected.to have_http_status(:ok) }
end
