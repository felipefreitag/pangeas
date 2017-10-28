# frozen_string_literal: true

class Iugu
  class Customer
    attr_reader :api

    def initialize(options)
      @api = options[:api]
    end

    def create(params)
      response = @api.post('customers', body: params.to_json)
    end
  end
end
