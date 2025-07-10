module Secured
  extend ActiveSupport::Concern

  included do
  end

  def require_login!
    unless session[:userinfo].present?
      session[:redirect_path] = request.fullpath
      redirect_to "/auth/redirect"
    end
  end

  def require_admin!
    unless session[:userinfo]&.dig("roles")&.include?("admin")
      redirect_to root_path, alert: "Доступ запрещён"
    end
  end
end
