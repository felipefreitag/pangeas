# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(_resource)
    new_payment_path(recurrence: params[:recurrence])
  end
end
