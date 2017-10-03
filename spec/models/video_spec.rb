# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Video, type: :model do
  describe 'associations' do
    it { expect(subject).to belong_to(:category) }
    it { expect(subject).to belong_to(:series) }
  end

  describe 'validations' do
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_presence_of(:description) }
    it { expect(subject).to validate_presence_of(:vimeo_id) }
  end
end
