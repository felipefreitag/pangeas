# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /users/sign_in', type: :request do
  subject { response }

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
      state: 'foo'
    )
  end

  context 'when user signs in' do
    context 'from the payment screen' do
      before do
        get new_payment_path
        post user_session_path, params: {
          'user[email]': user.email,
          'user[password]': user.password
        }
      end

      it { is_expected.to redirect_to(new_payment_path) }
    end

    context 'from the payment -> sign_up screen' do
      before do
        get new_payment_path
        get new_user_registration_path
        get new_user_session_path
        post user_session_path, params: {
          'user[email]': user.email,
          'user[password]': user.password
        }
      end

      it { is_expected.to redirect_to(new_payment_path) }
    end

    context 'having a subscription' do
      before do
        subscription = Subscription.create!(
          user: user, recurrence: 'monthly', iugu_id: '1'
        )
        subscription.activate!
        post user_session_path, params: {
          'user[email]': user.email,
          'user[password]': user.password
        }
      end

      it { is_expected.to redirect_to(sections_path) }
    end

    context 'having a course' do
      let(:course) do
        Course.create!(
          name: 'baz course',
          description: 'some course description',
          lesson_detail: 'foo',
          subsection: subsection,
          vimeo_id: '1234',
          image_url: 'http://foo',
          instructor: 'foo',
          credentials: 'foo',
          price: '1000',
          discount_price: '900'
        )
      end

      let!(:section) do
        Section.create!(
          name: 'foo section',
          description: 'some section description',
          image_url: 'http://image-url'
        )
      end

      let!(:subsection) do
        Subsection.create!(
          name: 'bar subsection',
          section: section
        )
      end

      before do
        Purchase.create!(
          user: user, course: course, price: course.price, installments: '1'
        )
        post user_session_path, params: {
          'user[email]': user.email,
          'user[password]': user.password
        }
      end

      it { is_expected.to redirect_to(courses_path) }
    end

    context 'without payment, subscription or course' do
      before do
        post user_session_path, params: {
          'user[email]': user.email,
          'user[password]': user.password
        }
      end

      it { is_expected.to redirect_to(root_path) }
    end
  end
end
