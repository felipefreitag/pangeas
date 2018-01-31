# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /courses/:id/watch', type: :request do
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

  let!(:course2) do
    Course.create!(
      name: 'foo course',
      description: 'another course description',
      lesson_detail: 'foo',
      subsection: subsection,
      vimeo_id: '1234',
      image_url: 'http://foo',
      instructor: 'foo',
      credentials: 'foo',
      price: '2000',
      discount_price: '1900'
    )
  end

  context 'without logged user' do
    before do
      get "/courses/#{course.id}/watch"
    end

    it { is_expected.to have_http_status(:found) }
  end

  context 'with logged user' do
    let!(:user) do
      User.create!(
        first_name: 'jane',
        last_name: 'doe',
        email: 'bar@baz.com',
        password: '123456',
        cpf: '1234567890',
        address: 'foo',
        address_number: '42',
        zip_code: '123',
        city: 'foo',
        state: 'foo'
      )
    end

    context 'who did not buy any course' do
      before do
        sign_in user
        get "/courses/#{course.id}/watch"
      end

      it { is_expected.to have_http_status(:found) }
    end

    context 'who bought only other courses' do
      before do
        Purchase.create!(user: user, course: course2)
        sign_in user
        get "/courses/#{course.id}/watch"
      end

      it { is_expected.to have_http_status(:found) }
    end

    context 'who bought the course' do
      before do
        Purchase.create!(user: user, course: course)
        sign_in user
        get "/courses/#{course.id}/watch"
      end

      it { is_expected.to have_http_status(:ok) }
    end

    context 'who bought the course and others' do
      before do
        Purchase.create!(user: user, course: course2)
        Purchase.create!(user: user, course: course)
        sign_in user
        get "/courses/#{course.id}/watch"
      end

      it { is_expected.to have_http_status(:ok) }
    end
  end
end
