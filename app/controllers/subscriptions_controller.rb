# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    authorize Subscription
  end
end
