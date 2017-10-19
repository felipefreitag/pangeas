# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do

  let!(:user) do
    User.create!(
      first_name: 'john',
      last_name: 'doe',
      email: 'foo@bar.com',
      password: '123456'
    )
  end

  let!(:subscription) do
    Subscription.create!(
      user: user,
      state: 'active',
      recurrence: 'monthly'
    )
  end

  let!(:user2) do
    User.create!(
      first_name: 'jane',
      last_name: 'doe',
      email: 'bar@baz.com',
      password: '123456'
    )
  end

  let!(:subscription2) do
    Subscription.create!(
      user: user,
      recurrence: 'monthly'
    )
  end

  let!(:user3) do
    User.create!(
      first_name: 'jim',
      last_name: 'doe',
      email: 'baz@boo.com',
      password: '123456'
    )
  end

  describe 'associations' do
    it { expect(subject).to have_many(:subscriptions) }
  end

  describe 'validations' do
    it { expect(subject).to validate_presence_of(:first_name) }
    it { expect(subject).to validate_presence_of(:last_name) }
  end

  describe 'subscribed' do
    it 'returns true with an active subscription' do
      expect(user.subscribed?).to be(true)
    end

    it 'returns false without an active subscription' do
      expect(user2.subscribed?).to be(false)
    end

    it 'returns false without a subscription' do
      expect(user3.subscribed?).to be(false)
    end
  end
end
