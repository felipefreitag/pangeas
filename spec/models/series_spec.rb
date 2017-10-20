# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Series, type: :model do
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

  describe 'associations' do
    it { expect(subject).to belong_to(:category) }
    it { expect(subject).to have_many(:videos) }
  end

  describe 'validations' do
    it { expect(subject).to validate_presence_of(:category) }
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_presence_of(:description) }
  end

  describe '.image' do
    context 'with series image_url set' do
      let!(:series) do
        Series.create!(
          name: 'foo bar',
          description: 'Amig Goswami é uma das maiores autoridades mundiais em
            Psicologia Quântica. Nesta palestra, ele faz um contraponto entre a
            Psicologia tradicional e a Quântica. Ele sua fala ele mostra que o
            modelo comportamental',
          category: category,
          image_url: 'http://foo'
        )
      end
      it 'returns the series image url' do
        expect(series.image).to eq('http://foo')
      end
    end

    context 'without series image_url set' do
      let!(:series) do
        Series.create!(
          name: 'foo bar',
          description: 'Amig Goswami é uma das maiores autoridades mundiais em
            Psicologia Quântica. Nesta palestra, ele faz um contraponto entre a
            Psicologia tradicional e a Quântica. Ele sua fala ele mostra que o
            modelo comportamental',
          category: category
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
          series: series,
          image_url: 'http://foobar.png'
        )
      end

      it 'returns the first video image url' do
        expect(series.image).to eq(video.image_url)
      end
    end
  end
end
