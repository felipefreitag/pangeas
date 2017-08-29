require 'rails_helper'

RSpec.describe Subsection, type: :model do
  describe "associations" do
    it { expect(subject).to belong_to(:section) }
  end

  describe "validations" do
    it { expect(subject).to validate_presence_of(:section) }
    it { expect(subject).to validate_presence_of(:name) }
  end
end
