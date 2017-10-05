# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Show section', type: :request do
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
      name: 'Vida em Equilíbrio',
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

  let!(:category) do
    Category.create!(
      name: 'baz category',
      description: 'some category description',
      subsection: subsection
    )
  end

  let!(:video) do
    Video.create!(
      name: 'foo bar',
      description: 'Amig Goswami é uma das maiores autoridades mundiais em
          Psicologia Quântica. Nesta palestra, ele faz um contraponto entre a
          Psicologia tradicional e a Quântica. Ele sua fala ele mostra que o
          modelo comportamental',
      vimeo_id: '163721649',
      category: category,
      image_url: 'http://foo.png'
    )
  end

  let!(:video2) do
    Video.create!(
      name: 'foo bar',
      description: 'Amig Goswami é uma das maiores autoridades mundiais em
          Psicologia Quântica. Nesta palestra, ele faz um contraponto entre a
          Psicologia tradicional e a Quântica. Ele sua fala ele mostra que o
          modelo comportamental',
      vimeo_id: '163721649',
      category: category,
      image_url: 'http://foo.png'
    )
  end

  let!(:video3) do
    Video.create!(
      name: 'foo bar',
      description: 'Amig Goswami é uma das maiores autoridades mundiais em
          Psicologia Quântica. Nesta palestra, ele faz um contraponto entre a
          Psicologia tradicional e a Quântica. Ele sua fala ele mostra que o
          modelo comportamental',
      vimeo_id: '163721649',
      category: category,
      image_url: 'http://foo.png'
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
      expect(subject).to render_template(:show)
    end
  end
end
