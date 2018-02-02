# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Course, type: :model do
  subject(:course) do
    Course.create!(
      name: 'baz course',
      description: 'some course description',
      subsection: subsection,
      vimeo_id: '1234',
      image_url: 'http://foo',
      instructor: 'foo',
      credentials: 'foo',
      price: '1000',
      discount_price: '900'
    )
  end

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

  describe 'associations' do
    it { is_expected.to belong_to(:subsection) }
    it { is_expected.to have_many(:videos) }
    it { is_expected.to have_many(:series) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:subsection) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:vimeo_id) }
    it { is_expected.to validate_presence_of(:image_url) }
    it { is_expected.to validate_presence_of(:instructor) }
    it { is_expected.to validate_presence_of(:credentials) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:discount_price) }
  end
end
