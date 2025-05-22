class PaymentsController < ApplicationController
  def create
    Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)

    cart = cookies.signed[:cart] || {}
    clothings = Clothing.where(id: cart.keys)

    total_price = clothings.sum do |clothing|
      clothing.price * cart[clothing.id.to_s]
    end

    amount = (total_price * 100).to_i

    session = Stripe::Checkout::Session.create(
      payment_method_types: [ "card" ],
      line_items: [ {
        price_data: {
          currency: "usd",
          product_data: {
            name: "CART"
          },
          unit_amount: amount
        },
        quantity: 1
      } ],
      mode: "payment",
      success_url: root_url,
      cancel_url: root_url
    )

    redirect_to session.url, allow_other_host: true
  end
end
