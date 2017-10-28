Rails.application.config.middleware.use(
  Rack::Affiliates, param: 'aff', extra_params: [:campaign]
)
