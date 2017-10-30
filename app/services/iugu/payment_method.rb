# frozen_string_literal: true

class Iugu
  class PaymentMethod
    attr_reader :api, :id

    def initialize(options)
      @api = options[:api]
      @id = nil
    end

    def create(params)
      merged_params = {
        description: 'Sign-up credit card',
        set_as_default: true
      }.merge(params)

      api.post(
        "/customers/#{params[:customer_id]}/payment_methods}",
        body: merged_params.to_json
      )
    end
  end
end
