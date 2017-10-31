# frozen_string_literal: true

class Iugu
  class Subscription
    attr_reader :api, :id

    def initialize(options)
      @api = options[:api]
      @id = nil
    end

    def create(params)
      merged_params = { credits_based: false }.merge(params)
      response = api.post(
        '/subscriptions',
        body: merged_params.to_json
      )
      @id = response.json['id']
    end
  end
end
