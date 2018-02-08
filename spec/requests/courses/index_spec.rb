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
  end

  context 'without logged in user' do
    before do
      get courses_path
    end

    it { is_expected.to have_http_status(:ok) }
  end

  context 'with logged in user' do
    let!(:user) do
      User.create!(
        first_name: 'jane',
        last_name: 'doe',
        email: 'bar@baz.com',
        password: '123456',
        cpf: '1234567890',
        iugu_id: '1',
        address: 'foo',
        address_number: '42',
        zip_code: '123',
        city: 'foo',
        state: 'foo'
      )
    end

    context 'without params' do
      before do
        sign_in user
        get courses_path(my_courses: true)
      end

      it { is_expected.to have_http_status(:ok) }
    end

    context 'listing only the user courses' do
      before do
        sign_in user
        get courses_path(my_courses: true)
      end

      it { is_expected.to have_http_status(:ok) }
    end
  end
end
