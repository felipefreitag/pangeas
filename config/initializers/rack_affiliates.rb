# frozen_string_literal: true

Rails.application.config.middleware.use(
  Rack::Affiliates, param: 'aff', path: '/', extra_params: [:campaign]
)
