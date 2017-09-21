require 'rails_helper'

RSpec.describe "Show series", type: :request do
  subject { response }

  let!(:section) {
    Section.create!(
      name: 'foo section',
      description: 'some section description',
      image_url: 'http://image-url'
    )
  }

  let!(:subsection) {
    Subsection.create!(
      name: "bar subsection",
      section: section,
    )
  }

  let!(:category) {
    Category.create!(
      name: 'baz category',
      description: 'some category description',
      subsection: subsection,
    )
  }

  let!(:series) {
    Series.create!(
      name: 'foo bar',
      description: 'Amig Goswami é uma das maiores autoridades mundiais em Psicologia
        Quântica. Nesta palestra, ele faz um contraponto entre a Psicologia tradicional
        e a Quântica. Ele sua fala ele mostra que o modelo comportamental',
      category: category,
    )
  }

  describe "GET" do
    before do
      get "/series/#{series.id}"
    end

    it "is returns ok" do
      expect(subject).to have_http_status(:ok)
    end
  end
end
