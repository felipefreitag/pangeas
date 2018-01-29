# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /videos/:id', type: :request do
  subject { response }

  let!(:video) do
    Video.create!(
      name: 'foo bar',
      description: 'Amig Goswami é uma das maiores autoridades mundiais em
        Psicologia Quântica. Nesta palestra, ele faz um contraponto entre a
        Psicologia tradicional e a Quântica. Ele sua fala ele mostra que o
        modelo comportamental',
      vimeo_id: '163721649',
      image_url: 'http://foo.png'
    )
  end

  context 'without logged user' do
    before do
      get "/videos/#{video.id}"
    end

    it { is_expected.to have_http_status(:found) }
  end

  context 'with logged user' do
    let!(:user) do
      User.create!(
        first_name: 'john',
        last_name: 'doe',
        email: 'foo@bar.com',
        password: '123456',
        cpf: '1234567890',
        address: 'foo',
        address_number: '42',
        zip_code: '123',
        city: 'foo',
        state: 'foo'
      )
    end

    context 'without subscription' do
      before do
        sign_in user
        get "/videos/#{video.id}"
      end

      it { is_expected.to have_http_status(:found) }
    end

    context 'with subscription' do
      before do
        Subscription.create!(
          user: user,
          state: 'active',
          recurrence: 'monthly'
        )
        sign_in user
        get "/videos/#{video.id}"
      end

      it { is_expected.to have_http_status(:ok) }
    end
  end

  context 'when video belongs to a course' do
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

    let!(:user) do
      User.create!(
        first_name: 'john',
        last_name: 'doe',
        email: 'foo@bar.com',
        password: '123456',
        cpf: '1234567890',
        address: 'foo',
        address_number: '42',
        zip_code: '123',
        city: 'foo',
        state: 'foo'
      )
    end

    before do
      video.update!(course: course)
    end

    context 'without logged user' do
      before do
        get "/videos/#{video.id}"
      end

      it { is_expected.to have_http_status(:found) }
    end

    context 'with logged user who did not buy the video' do
      before do
        sign_in user
        get "/videos/#{video.id}"
      end

      it { is_expected.to have_http_status(:found) }
    end

    context 'with logged user who bought the video' do
      before do
        user.update(courses: [course])
        sign_in user
        get "/videos/#{video.id}"
      end

      it { is_expected.to have_http_status(:ok) }
    end
  end
end
