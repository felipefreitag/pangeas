# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserPolicy do
  subject { described_class }

  let(:user) do
    User.create!(
      first_name: 'john',
      last_name: 'doe',
      email: 'foo@bar.com',
      password: '123456',
      cpf: '1234567890',
      admin: admin,
      address: 'foo',
      address_number: '42',
      zip_code: '123',
      city: 'foo',
      state: 'foo',
      country: 'foo'
    )
  end

  permissions :index?, :create?, :update?, :destroy? do
    context 'when user is admin' do
      let(:admin) { true }

      it { is_expected.to permit(user) }
    end

    context 'when user is not admin' do
      let(:admin) { false }

      it { is_expected.not_to permit(user) }
    end
  end

  permissions :show? do
    context 'when user is not admin' do
      let(:admin) { false }

      it { is_expected.to permit(user, user) }

      context 'when it is another user' do
        let(:user2) do
          User.create!(
            first_name: 'john',
            last_name: 'doe',
            email: 'foo@baz.com',
            password: '123456',
            cpf: '1234567890',
            address: 'foo',
            address_number: '42',
            zip_code: '123',
            city: 'foo',
            state: 'foo',
            country: 'foo'
          )
        end

        it { is_expected.not_to permit(user, user2) }
      end
    end

    context 'when user is admin' do
      let(:admin) { true }

      let(:user2) do
        User.create!(
          first_name: 'john',
          last_name: 'doe',
          email: 'foo@baz.com',
          password: '123456',
          cpf: '1234567890',
          address: 'foo',
          address_number: '42',
          zip_code: '123',
          city: 'foo',
          state: 'foo',
          country: 'foo'
        )
      end

      it { is_expected.to permit(user, user2) }
    end
  end
end
