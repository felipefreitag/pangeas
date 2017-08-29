require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "associations" do
    it { expect(subject).to belong_to(:subsection) }
  end

  describe "validations" do
    it { expect(subject).to validate_presence_of(:subsection) }
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_presence_of(:description) }
  end
end
