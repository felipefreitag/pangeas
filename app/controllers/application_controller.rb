# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception
  helper_method :namespace
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action(
    :authenticate_user!,
    unless: -> { pages_controller? || devise_controller? }
  )
  before_action :sections
  after_action(
    :verify_authorized,
    unless: -> { pages_controller? || devise_controller? }
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
    redirect_to(root_path)
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

  def authenticate_user!
    if user_signed_in?
      super
    else
      flash[:info] =
        'Para continuar, cadastre-se ou faça login.'
      session[:user_return_to] = request.fullpath
      redirect_to new_user_registration_url unless user_signed_in?
    end
  end

  def after_sign_in_path_for(_resource)
    session[:user_return_to] ||
      current_user.subscribed? && sections_path ||
      current_user.courses? && courses_path ||
      root_path
  end

  def permitted_sign_up_parameters
    %i[
      first_name last_name affiliate_tag cpf address address_number
      address_complement zip_code neighborhood city state terms_of_service
    ]
  end

  private

  def pages_controller?
    self.class == HighVoltage::PagesController
  end
end
