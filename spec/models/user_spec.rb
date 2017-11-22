# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) do
    User.create!(
      first_name: 'john',
      last_name: 'doe',
      email: 'foo@bar.com',
      password: '123456',
      cpf: '1234567890',
      address: 'foo',
      address_number: '42',
      zip_code: '123',
      city: 'foo',
      state: 'foo',
      country: 'foo',
      phone: '123456'
    )
  end

  describe 'associations' do
    it { is_expected.to have_many(:subscriptions) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:cpf) }
    it { is_expected.to validate_presence_of(:zip_code) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:address_number) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:state) }
    it { is_expected.to validate_presence_of(:country) }
    it { is_expected.to validate_presence_of(:phone) }
  end

  describe 'subscribed?' do
    subject { user.subscribed? }

    context 'with an active subscription' do
      before do
        Subscription.create!(user: user, state: 'active', recurrence: 'monthly')
      end

      it { is_expected.to be(true) }
    end

    context 'with a non-active subscription' do
      before do
        Subscription.create!(user: user, recurrence: 'monthly')
      end

      it { is_expected.to be(false) }
    end
  end

  describe 'subscription' do
    subject { user.subscription }

    context 'without subscriptions' do
      it { is_expected.to be(nil) }
    end

    context 'with subscriptions' do
      before do
        Subscription.create!(user: user, recurrence: 'monthly')
        Subscription.create!(user: user, recurrence: 'anual')
      end

      it { is_expected.to eq(user.subscriptions.order(:created_at).last) }
    end
  end
end
