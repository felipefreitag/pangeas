# frozen_string_literal: true

require_relative '../../lib/iugu'

class PaymentsController < ApplicationController
  skip_after_action :verify_authorized

  def new
    iugu = Iugu::Integration.new(token: ENV['IUGU_API_TOKEN'])
    response = iugu.customer.create(
      email: current_user.email,
      name: name
    )
    return render_error unless response.success?
    current_user.update! iugu_id: response.json['id']
  end

  private

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
