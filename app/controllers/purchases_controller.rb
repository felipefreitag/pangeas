# frozen_string_literal: true

class PurchasesController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    authorize Purchase
  end

  def create
    authorize Purchase
  end

  def show
    authorize Purchase
  end

  def render_error(message)
    flash[:failure] =
      "Ooops, alguma coisa deu errado com #{message} no Iugu. " \
      'Por favor, tente novamente mais tarde.'
    redirect_to root_path
  end
end
