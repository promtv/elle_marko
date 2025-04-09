OmniAuth.config.allowed_request_methods = [ :post, :get ]
OmniAuth.config.silence_get_warning = true

Rails.application.config.middleware.use OmniAuth::Builder do
  auth0_config = Rails.application.credentials.dig(:auth0)

  if auth0_config.blank?
    raise "Auth0 configuration is missing! Please check your credentials."
  end

  provider(
    :auth0,
    auth0_config[:client_id],
    auth0_config[:client_secret],
    auth0_config[:domain],
    callback_path: "/auth/auth0/callback",
    authorize_params: {
      scope: "openid profile"
    }
  )
end
