class ReviewsController < ApplicationController
  include Secured
  before_action :require_login!, only:  [ :create ]
  before_action :require_admin!, only: [ :destroy ]

        def create
          @clothing = Clothing.find(params[:clothing_id])
          @review = @clothing.reviews.new(review_params)
          @review.user_name = session[:userinfo]["info"]["name"]

          if @review.save
            redirect_to @clothing, notice: "Спасибо за отзыв!"
          else
            redirect_to @clothing, alert: "Пожалуйста, заполните все поля."
          end
        end
        def destroy
          @clothing = Clothing.find(params[:clothing_id])
          @review = @clothing.reviews.find(params[:id])
          @review.destroy
          redirect_to @clothing
        end

        private

        def review_params
          params.require(:review).permit(:content, :rating)
        end
end
