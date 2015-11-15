OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, 976159652430163, '36e9a375fd7caf988772f82985cf0514'
end