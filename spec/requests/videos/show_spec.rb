require 'rails_helper'

RSpec.describe "Show video", type: :request do
  subject { response }

  let!(:video) {
    Video.create!(
      name: 'foo bar',
      description: 'Amig Goswami é uma das maiores autoridades mundiais em Psicologia
        Quântica. Nesta palestra, ele faz um contraponto entre a Psicologia tradicional
        e a Quântica. Ele sua fala ele mostra que o modelo comportamental',
      vimeo_id: '163721649',
    )
  }

  describe "GET" do
    before do
      get "/videos/#{video.id}"
    end

    it "Renders show video template" do
      expect(subject).to have_http_status(:ok)
    end
  end
end
