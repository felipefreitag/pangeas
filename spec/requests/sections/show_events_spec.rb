# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Show Events section', type: :request do
  subject { response }

  let!(:section) do
    Section.create!(
      name: 'Eventos & Pesquisa',
      description: 'some section description',
      image_url: 'http://image-url'
    )
  end

  let!(:subsection) do
    Subsection.create!(
      name: 'events',
      section: section
    )
  end

  let!(:category) do
    Category.create!(
      name: 'Eventos',
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

  describe 'GET' do
    before do
      get "/sections/#{section.id}"
    end

    it 'Returns ok' do
      expect(subject).to have_http_status(:ok)
    end

    it 'Renders the correct template' do
      expect(subject).to render_template(:show_events)
    end
  end
end
