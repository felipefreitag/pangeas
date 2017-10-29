# frozen_string_literal: true

class PaymentsController < ApplicationController
  skip_after_action :verify_authorized

  def new
    iugu = Iugu.new(token: ENV['IUGU_API_TOKEN'])
    iugu.customer.create(
      email: current_user.email,
      name: "#{current_user.first_name} #{current_user.last_name}"
    )
  end
end
