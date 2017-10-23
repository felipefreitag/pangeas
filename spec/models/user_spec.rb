# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:subscriptions) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
  end

  describe 'subscribed?' do
    subject { user.subscribed? }

    let!(:user) do
      User.create!(
        first_name: 'john',
        last_name: 'doe',
        email: 'foo@bar.com',
        password: '123456'
      )
    end

    context 'with an active subscription' do
      before do
        Subscription.create!(
          user: user,
          state: 'active',
          recurrence: 'monthly'
        )
      end

      it 'returns true' do
        is_expected.to be(true)
      end
    end

    context 'with a non-active subscription' do
      before do
        Subscription.create!(
          user: user,
          recurrence: 'monthly'
        )
      end

      it 'returns false' do
        is_expected.to be(false)
      end
    end
  end
end
