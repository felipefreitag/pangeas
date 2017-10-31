# frozen_string_literal: true

class PaymentsController < ApplicationController
  skip_after_action :verify_authorized

  def new
    iugu = Iugu::Integration.new(token: ENV['IUGU_API_TOKEN'])
    return unless current_user.iugu_id
    customer = create_customer(iugu)
    current_user.update! iugu_id: customer['id']
  end

  private

  def create_customer(iugu)
    response = iugu.customer.create(
      email: current_user.email,
      name: name
    )
    return render_error unless response.success?
    response.json
  end

  def name
    "#{current_user.first_name} #{current_user.last_name}"
  end

  def render_error
    flash[:failure] =
      'Ooops, alguma coisa deu errado com seu cadastro no Iugu. ' \
      'Por favor, tente novamente mais tarde.'
    redirect_to root_path
  end
end
