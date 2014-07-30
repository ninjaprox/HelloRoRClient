OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1443739292578468', 'b5766a942142e3753aabaf7150daa7ac'
end