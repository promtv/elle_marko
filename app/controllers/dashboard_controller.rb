class DashboardController < ApplicationController
  include Secured

  def show
    @user = session[:userinfo] # This retrieves the user information stored in the session after authentication.
  end
end
