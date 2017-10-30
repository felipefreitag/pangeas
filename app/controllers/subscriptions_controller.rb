# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    authorize Subscription
  end

  def create
    authorize Subscription
    payment_form_token = params[:token]
    redirect_to sections_path
  end
end
