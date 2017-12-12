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
  after_action(
    :verify_authorized,
    unless: lambda do
      devise_controller? ||
      self.class == HighVoltage::PagesController
    end
  )
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def sections
    @sections = Section.order(:id).all
  end

  def namespace
    names = self.class.to_s.split('::')
    return 'null' if names.length < 2
    names[0..(names.length - 2)].map(&:downcase).join('_')
  end

  def user_not_authorized(_exception)
    flash[:failure] = t('flash.not_authorized')
    redirect_to(new_subscription_path || root_path)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: permitted_sign_up_parameters
    )
    devise_parameter_sanitizer.permit(
      :account_update,
      keys: %i[first_name last_name email password password_confirmation]
    )
  end

  protected

  def after_sign_in_path_for(_resource)
    sections_path
  end

  def permitted_sign_up_parameters
    %i[
      first_name last_name affiliate_tag cpf address address_number
      address_complement zip_code neighborhood city state
    ]
  end
end
