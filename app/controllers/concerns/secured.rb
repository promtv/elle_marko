module Secured
  extend ActiveSupport::Concern

  included do
    # Ничего не вызываем автоматически, всё вручную через before_action
  end

  # Проверка, вошёл ли пользователь
  def require_login!
    unless session[:userinfo].present?
      session[:redirect_path] = request.fullpath
      redirect_to "/auth/redirect"
    end
  end

  # Проверка, является ли пользователь админом
  def require_admin!
    unless session[:userinfo]&.dig("roles")&.include?("admin")
      redirect_to root_path, alert: "Доступ запрещён"
    end
  end
end
