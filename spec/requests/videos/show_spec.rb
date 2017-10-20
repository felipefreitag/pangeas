# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Show video', type: :request do
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

    it 'redirects' do
      expect(subject).to have_http_status(:found)
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
        get "/videos/#{video.id}"
      end

      it 'redirects' do
        expect(subject).to have_http_status(:found)
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
        get "/videos/#{video.id}"
      end

      it 'returns ok' do
        expect(subject).to have_http_status(:ok)
      end
    end
  end
end
