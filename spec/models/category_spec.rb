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

  describe 'associations' do
    it { is_expected.to belong_to(:subsection) }
    it { is_expected.to have_many(:videos) }
    it { is_expected.to have_many(:series) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:subsection) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
  end

  describe '#highlight' do
    subject { category.highlight }

    let!(:series) do
      Series.create!(
        name: 'foo bar',
        description: 'barfoo',
        category: category,
        highlighted: highlighted_series
      )
    end

    let!(:video) do
      Video.create!(
        name: 'foo bar',
        description: 'barfoo',
        vimeo_id: '163721649',
        category: category,
        image_url: 'http://foo.png',
        highlighted: highlighted_video
      )
    end

    context 'with no highlights' do
      let(:highlighted_series) { false }
      let(:highlighted_video) { false }

      it { is_expected.to be(nil) }
    end

    context 'with a highlighted video and series' do
      let(:highlighted_series) { true }
      let(:highlighted_video) { true }

      it { is_expected.to eq(series) }
    end

    context 'with a highlighted video' do
      let(:highlighted_series) { false }
      let(:highlighted_video) { true }

      it { is_expected.to eq(video) }
    end
  end
end
