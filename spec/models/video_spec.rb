# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Video, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:category) }
    it { is_expected.to belong_to(:series) }
    it { is_expected.to belong_to(:course) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:vimeo_id) }
    it { is_expected.to validate_presence_of(:image_url) }
  end

  describe '.latest' do
    let(:sql) do
      'SELECT  "videos".* FROM "videos" INNER JOIN "categories" ON '\
      '"categories"."id" = "videos"."category_id" INNER JOIN "subsections" ON '\
      '"subsections"."id" = "categories"."subsection_id" INNER JOIN "sections"'\
      ' ON "sections"."id" = "subsections"."section_id" WHERE '\
      "(sections.name = 'foobar') ORDER BY created_at DESC LIMIT 2"
    end

    it 'returns the correct SQL' do
      expect(described_class.latest('foobar', 2).to_sql).to eq(sql)
    end
  end
end
