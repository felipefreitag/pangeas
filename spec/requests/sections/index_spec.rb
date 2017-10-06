# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sections index', type: :request do
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
      name: 'foo section',
      description: 'some section description',
      image_url: 'http://image-url'
    )
  end

  describe 'without logged user' do
    before do
      get '/sections'
    end

    it 'redirects' do
      expect(subject).to have_http_status(:found)
    end
  end

  describe 'with logged user' do
    before do
      sign_in user
      get '/sections'
    end

    it 'returns ok' do
      expect(subject).to have_http_status(:ok)
    end
  end
end
