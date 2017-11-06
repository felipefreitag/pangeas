# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationPolicy do
  subject { described_class }

  let(:user) do
    User.create!(
      first_name: 'john',
      last_name: 'doe',
      email: 'foo@bar.com',
      password: '123456',
      admin: admin
    )
  end

  permissions :index? do
    let(:admin) { false }

    it { is_expected.to permit(user) }
  end

  permissions :create?, :new?, :update?, :edit?, :destroy? do
    context 'when user is admin' do
      let(:admin) { true }

      it { is_expected.to permit(user) }
    end

    context 'when user is not admin' do
      let(:admin) { false }

      it { is_expected.not_to permit(user) }
    end
  end
end
