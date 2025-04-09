class Auth0Controller < ApplicationController
  def callback
    auth_info = request.env["omniauth.auth"]
    session[:userinfo] = {
      uid: auth_info["uid"],
      info: auth_info["info"],
      extra: auth_info["extra"]
    }
    redirect_to session.delete(:redirect_path) || "/dashboard"
  end

  def failure
    @error_msg = request.params["message"]
    render plain: "Authentication failed: #{@error_msg}", status: :unauthorized
  end

  def logout
    reset_session
    redirect_to logout_url, allow_other_host: true
  end

  private

  def logout_url
    auth0_config = Rails.application.credentials.dig(:auth0)
    request_params = {
      returnTo: root_url,
      client_id: auth0_config[:client_id]
    }

    URI::HTTPS.build(
      host: auth0_config[:domain],
      path: "/v2/logout",
      query: to_query(request_params)
    ).to_s
  end

  def to_query(hash)
    hash.map { |k, v| "#{k}=#{CGI.escape(v.to_s)}" }.join("&")
  end
end
