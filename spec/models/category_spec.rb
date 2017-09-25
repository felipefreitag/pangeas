require 'rails_helper'

RSpec.describe Category, type: :model do

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

  describe "associations" do
    it { expect(subject).to belong_to(:subsection) }
    it { expect(subject).to have_many(:videos) }
    it { expect(subject).to have_many(:series) }
  end

  describe "validations" do
    it { expect(subject).to validate_presence_of(:subsection) }
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_presence_of(:description) }
  end

  describe "latest video" do
    it "Returns the video" do
      expect(category.latest_video).to eq(video)
    end
  end
end
