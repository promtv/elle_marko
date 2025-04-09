class DashboardController < ApplicationController
  include Secured # This module is included to ensure that the user is authenticated before accessing the dashboard.

  def show
    @user = session[:userinfo] # This retrieves the user information stored in the session after authentication.
  end
end
