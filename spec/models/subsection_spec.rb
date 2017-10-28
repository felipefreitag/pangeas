# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Subsection, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:section) }
    it { is_expected.to have_many(:categories) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:section) }
    it { is_expected.to validate_presence_of(:name) }
  end
end
