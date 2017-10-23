# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized

  def new; end
end
