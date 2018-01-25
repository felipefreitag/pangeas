# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /courses/:id', type: :request do
  subject { response }

  let!(:section) do
    Section.create!(
      name: 'foo section',
      description: 'some section description',
      image_url: 'http://image-url'
    )
  end

  let!(:subsection) do
    Subsection.create!(
      name: 'bar subsection',
      section: section
    )
  end

  let!(:course) do
    Course.create!(
      name: 'baz course',
      description: 'some course description',
      class_detail: 'foo',
      subsection: subsection,
      vimeo_id: '1234',
      image_url: 'http://foo',
      instructor: 'foo',
      credentials: 'foo',
      price: '1000',
      discount_price: '900'
    )
  end

  before do
    get "/courses/#{course.id}"
  end

  it { is_expected.to have_http_status(:ok) }
end
