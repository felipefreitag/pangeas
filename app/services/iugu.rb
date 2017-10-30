# frozen_string_literal: true

class Iugu
  attr_reader :token, :customer, :api, :payment_method, :subscription

  def initialize(options)
    @token = options[:token]
    @api = API.new(options)
    @customer = Customer.new(options.merge(api: @api))
    @payment_method = PaymentMethod.new(options.merge(api: @api))
    @subscription = IuguSubscription.new(options.merge(api: @api))
  end
end
