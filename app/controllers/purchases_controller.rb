# frozen_string_literal: true

class PurchasesController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    authorize Purchase
    @course = Course.find(params[:course])
  end

  def create
    authorize Purchase
    iugu = Iugu::Integration.new(token: ENV['IUGU_API_TOKEN'])
    @course = Course.find(params[:purchase][:course])
    return render_error('o curso escolhido') unless @course
    iugu_charge = create_iugu_charge(iugu, @course)
    return render_error('sua cobrança') unless iugu_charge
    purchase = create_purchase(
      purchase_params, @course, iugu_charge['invoice_id']
    )
    redirect_to purchase
  end

  def show
    @purchase = Purchase.find(params[:id])
    authorize @purchase
  end

  private

  def create_purchase(attributes, course, invoice_id)
    Purchase.create!(attributes.merge(
      user: current_user,
      course: @course,
      invoice_id: invoice_id,
      paid: true,
      price: current_user.subscribed? ? course.discount_price : course.price,
      affiliate_tag: request.env['affiliate.tag'].presence
    ))
  end

  def create_iugu_charge(iugu, course)
    response = iugu.charge.create(
      token: params[:token],
      customer_id: current_user.iugu_id,
      months: params[:purchase][:installments],
      items: {
        description: course.name, quantity: 1, price_cents: price_cents(course)
      }
    )
    return unless response.success?
    response.json
  end

  def price_cents(course)
    price = current_user.subscribed? ? course.discount_price : course.price
    "#{price}00"
  end

  def purchase_params
    params.require(:purchase).permit(:installments)
  end

  def render_error(message)
    flash[:failure] =
      "Ooops, alguma coisa deu errado com #{message} no Iugu. " \
      'Por favor, tente novamente mais tarde.'
    redirect_to root_path
  end
end
