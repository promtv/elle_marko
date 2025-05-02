class DashboardController < ApplicationController
  include Secured
  before_action :require_login!, only: [ :show ]

  def show
    @user = session[:userinfo] # This retrieves the user information stored in the session after authentication.
  end
end
