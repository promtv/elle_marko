class CartsController < ApplicationController
  def add
    clothings_id = params[:clothings_id]
    cart = cookies.signed[:cart] || {}

    cart[clothings_id] = cart[clothings_id] ? cart[clothings_id] + 1 : 1

    cookies.signed[:cart] = {
      value: cart,
      expires: 7.days.from_now
    }

    redirect_to clothings_path
  end

  def show
    @clothings = Clothings.where(id: cookies.signed[:cart].keys).map { |clothings| [ clothings, cookies.signed[:cart][clothings.id.to_s] ] }
  end
end
