# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Section, type: :model do
  describe 'associations' do
    it { expect(subject).to have_many(:subsections) }
  end

  describe 'validations' do
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_presence_of(:description) }
    it { expect(subject).to validate_presence_of(:image_url) }
  end
end
