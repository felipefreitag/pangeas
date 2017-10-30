# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    authorize Subscription
  end

  def create
    authorize Subscription
    iugu = session[:iugu]
    # iugu.payment_method.create(
    #   customer_id: iugu.customer.id,
    #   token: params[:token],
    # )
    # subscription = Subscription.new(
    #   user_id: current_user[:id],
    #   recurrence: params[:recurrence]
    # )
  end
end
