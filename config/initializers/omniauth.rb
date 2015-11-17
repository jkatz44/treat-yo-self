OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, 1516232438701727, '5d43affcaeab20f1a01a806911259ef2'
end