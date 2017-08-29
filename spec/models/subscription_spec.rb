require 'rails_helper'

RSpec.describe Subscription, recurrence: :model do
  let(:user) { User.create!(
    email: "foo@bar.com",
    first_name: "Foo",
    last_name: "Bar",
    password: "foobarfoo",
  )}

  subject(:subscription) { Subscription.new(
    user: user,
    recurrence: "monthly",
  )}

  describe "associations" do
    it { expect(subject).to belong_to(:user) }
  end

  describe "validations" do
    it { expect(subject).to validate_presence_of(:user) }
    it { expect(subject).to validate_presence_of(:recurrence) }
  end

  describe "activate" do
    subject { subscription.activate! }

    it "updates activated at timestamp" do
      expect{ subject }.to change{ subscription.activated_at }.
        from(nil).to(anything)
    end
  end
end
