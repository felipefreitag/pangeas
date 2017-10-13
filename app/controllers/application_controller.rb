# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception
  helper_method :namespace
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action(
    :authenticate_user!,
    unless: -> { self.class == HighVoltage::PagesController }
  )
  before_action :sections
  # after_action :verify_authorized, unless: -> { devise_controller? }
  # after_action :verify_policy_scoped, unless: -> { devise_controller? }
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def sections
    @sections = Section.order(:id).all
  end

  def namespace
    names = self.class.to_s.split('::')
    return 'null' if names.length < 2
    names[0..(names.length - 2)].map(&:downcase).join('_')
  end

  def user_not_authorized(_exception)
    flash[:alert] = t('flash.not_authorized')
    redirect_to(request.referer || root_path)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
    devise_parameter_sanitizer.permit(
      :account_update,
      keys: %i[first_name last_name email password password_confirmation]
    )
  end

  protected

  def after_sign_in_path_for(_resource)
    sections_path
  end
end
