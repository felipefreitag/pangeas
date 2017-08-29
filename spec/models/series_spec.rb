require 'rails_helper'

RSpec.describe Series, type: :model do
  describe "associations" do
    it { expect(subject).to belong_to(:category) }
  end

  describe "validations" do
    it { expect(subject).to validate_presence_of(:category) }
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_presence_of(:description) }
  end
end
