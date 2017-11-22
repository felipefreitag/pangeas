# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /series/:id', type: :request do
  subject { response }

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

  let!(:category) do
    Category.create!(
      name: 'baz category',
      description: 'some category description',
      subsection: subsection
    )
  end

  let!(:series) do
    Series.create!(
      name: 'foo bar',
      description: 'Amig Goswami é uma das maiores autoridades mundiais em
        Psicologia Quântica. Nesta palestra, ele faz um contraponto entre a
        Psicologia tradicional e a Quântica. Ele sua fala ele mostra que o
        modelo comportamental',
      category: category
    )
  end

  context 'without logged user' do
    before do
      get "/series/#{series.id}"
    end

    it { is_expected.to have_http_status(:found) }
  end

  context 'with logged user' do
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

    context 'without subscription' do
      before do
        sign_in user
        get "/series/#{series.id}"
      end

      it { is_expected.to have_http_status(:found) }
    end

    context 'with subscription' do
      before do
        Subscription.create!(
          user: user,
          state: 'active',
          recurrence: 'monthly'
        )
        sign_in user
        get "/series/#{series.id}"
      end

      it { is_expected.to have_http_status(:ok) }
    end
  end
end
