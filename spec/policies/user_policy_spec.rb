# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User policy' do
  subject { UserPolicy }

  let(:user) do
    User.create!(
      first_name: 'john',
      last_name: 'doe',
      email: 'foo@bar.com',
      password: '123456',
      admin: true
    )
  end

  let!(:user2) do
    User.create!(
      first_name: 'jane',
      last_name: 'doe',
      email: 'bar@baz.com',
      password: '123456',
      admin: false
    )
  end

  permissions :index?, :create?, :update?, :destroy? do
    it 'allows access if user is admin' do
      expect(subject).to permit(user)
    end

    it 'denies access if user is not admin' do
      expect(subject).not_to permit(user2)
    end
  end
end
