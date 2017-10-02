require 'rails_helper'

RSpec.describe "Show Events section", type: :request do
  subject { response }

  let!(:section) {
    Section.create!(
      name: 'Eventos & Pesquisa',
      description: 'some section description',
      image_url: 'http://image-url'
    )
  }

  let!(:subsection) {
    Subsection.create!(
      name: "events",
      section: section,
    )
  }

  let!(:category) {
    Category.create!(
      name: 'Em destaque',
      description: 'some category description',
      subsection: subsection,
    )
  }

  let!(:video) {
    Video.create!(
      name: 'foo bar',
      description: 'Amig Goswami é uma das maiores autoridades mundiais em Psicologia
        Quântica. Nesta palestra, ele faz um contraponto entre a Psicologia tradicional
        e a Quântica. Ele sua fala ele mostra que o modelo comportamental',
      vimeo_id: '163721649',
      category: category,
      image_url: 'http://foo.png',
    )
  }

  describe "GET" do
    before do
      get "/sections/#{section.id}"
    end

    it "Returns ok" do
      expect(subject).to have_http_status(:ok)
    end
  end
end
