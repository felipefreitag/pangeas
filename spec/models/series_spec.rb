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
    it { is_expected.to belong_to(:category) }
    it { is_expected.to belong_to(:course) }
    it { is_expected.to have_many(:videos) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:category) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
  end

  describe '#image' do
    subject { series.image }

    context 'with series image_url set' do
      let(:series) { Series.new(image_url: 'http://foo') }

      it { is_expected.to eq('http://foo') }
    end

    context 'without series image_url set, with video' do
      let(:series) do
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

      it { is_expected.to eq(video.image_url) }
    end

    context 'without series image_url set, without video' do
      let(:series) { Series.new }

      it { is_expected.to eq(nil) }
    end
  end
end
