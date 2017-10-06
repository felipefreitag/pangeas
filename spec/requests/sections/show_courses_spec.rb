# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Show Courses section', type: :request do
  subject { response }

  let!(:user) do
    User.create!(
      first_name: 'john',
      last_name: 'doe',
      email: 'foo@bar.com',
      password: '123456'
    )
  end

  let!(:section) do
    Section.create!(
      name: 'Cursos Pangeas',
      description: 'some section description',
      image_url: 'http://image-url'
    )
  end

  describe 'without logged user' do
    before do
      get "/sections/#{section.id}"
    end

    it 'redirects' do
      expect(subject).to have_http_status(:found)
    end
  end

  describe 'with logged user' do
    before do
      sign_in user
      get "/sections/#{section.id}"
    end

    it 'returns ok' do
      expect(subject).to have_http_status(:ok)
    end

    it 'renders the correct template' do
      expect(subject).to render_template(:show_courses)
    end
  end
end
