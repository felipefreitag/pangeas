# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
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

  describe 'associations' do
    it { expect(subject).to belong_to(:subsection) }
    it { expect(subject).to have_many(:videos) }
    it { expect(subject).to have_many(:series) }
  end

  describe 'validations' do
    it { expect(subject).to validate_presence_of(:subsection) }
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_presence_of(:description) }
  end

  describe 'latest_video' do
    it 'returns the video' do
      expect(category.latest_video).to eq(video)
    end
  end
end
