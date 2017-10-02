# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Series, type: :model do

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
      image_url: 'http://foo',
    )
  }

  let!(:series2) {
    Series.create!(
      name: 'foo bar',
      description: 'Amig Goswami é uma das maiores autoridades mundiais em Psicologia
        Quântica. Nesta palestra, ele faz um contraponto entre a Psicologia tradicional
        e a Quântica. Ele sua fala ele mostra que o modelo comportamental',
      category: category,
    )
  }

  let!(:video) {
    Video.create!(
      name: 'foo bar',
      description: 'Amig Goswami é uma das maiores autoridades mundiais em Psicologia
        Quântica. Nesta palestra, ele faz um contraponto entre a Psicologia tradicional
        e a Quântica. Ele sua fala ele mostra que o modelo comportamental',
      vimeo_id: '163721649',
      series: series2,
      image_url: 'http://foobar.png',
    )
  }

  describe "associations" do
    it { expect(subject).to belong_to(:category) }
    it { expect(subject).to have_many(:videos) }
  end

  describe "validations" do
    it { expect(subject).to validate_presence_of(:category) }
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_presence_of(:description) }
  end

  describe "get image url" do
    context "with series image_url set" do
      it "returns the series image url" do
        expect(series.get_image_url).to eq('http://foo')
      end
    end

    context "without series image_url set" do
      it "Returns the first video image url" do
        expect(series2.get_image_url).to eq(video.image_url)
      end
    end
  end
end
