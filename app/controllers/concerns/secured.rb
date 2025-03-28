module Secured
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user
  end

  private

  def authenticate_user
    unless session[:userinfo].present?
      redirect_to "/auth/auth0" # Redirect to Auth0 for authentication
    end
  end
end
