require 'rails_helper'

RSpec.describe Section, type: :model do
  describe "validations" do
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_presence_of(:description) }
    it { expect(subject).to validate_presence_of(:image_url) }
  end
end
