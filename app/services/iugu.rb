# frozen_string_literal: true

class Iugu
  attr_reader :token, :customer, :api

  def initialize(options)
    @token = options[:token]
    @api = API.new(options)
    @customer = Customer.new(options.merge(api: @api))
  end
end
