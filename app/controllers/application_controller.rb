class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :initialize_cart_cookie

  private

  def initialize_cart_cookie
    cookies.signed[:cart] ||=  {
      value: {},
      expires: 7.days.from_now
    }
  end
end
