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

  context 'without logged user' do
    before do
      get "/sections/#{section.id}"
    end

    it 'redirects' do
      is_expected.to have_http_status(:found)
    end
  end

  context 'with logged user' do
    let!(:user) do
      User.create!(
        first_name: 'john',
        last_name: 'doe',
        email: 'foo@bar.com',
        password: '123456'
      )
    end

    context 'without subscription' do
      before do
        sign_in user
        get "/sections/#{section.id}"
      end

      it 'redirects' do
        is_expected.to have_http_status(:found)
      end
    end

    context 'with subscription' do
      let!(:subscription) do
        Subscription.create!(
          user: user,
          state: 'active',
          recurrence: 'monthly'
        )
      end

      before do
        sign_in user
        get "/sections/#{section.id}"
      end

      it 'returns ok' do
        is_expected.to have_http_status(:ok)
      end

      it 'renders the correct template' do
        is_expected.to render_template(:show_courses)
      end
    end
  end
end
