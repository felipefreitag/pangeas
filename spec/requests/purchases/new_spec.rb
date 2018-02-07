# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /purchases/new', type: :request do
  subject { response }

  let(:course) do
    Course.create!(
      name: 'baz course',
      description: 'some course description',
      lesson_detail: 'foo',
      subsection: subsection,
      vimeo_id: '1234',
      image_url: 'http://foo',
      instructor: 'foo',
      credentials: 'foo',
      price: '1000',
      discount_price: '900'
    )
  end

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

  context 'without a logged in user' do
    before do
      get '/purchases/new', params: { course: course.id }
    end

    it { is_expected.to have_http_status(:ok) }
  end
end
