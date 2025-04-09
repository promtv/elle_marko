module Secured
  extend ActiveSupport::Concern

  included do
    before_action :logged_in_using_omniauth?
  end

  def logged_in_using_omniauth?
    unless session[:userinfo].present?
      session[:redirect_path] = request.fullpath
      redirect_to "/auth/redirect"
    end
  end
end
