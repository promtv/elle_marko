class ClothingsController < ApplicationController
  def index
    @clothings = Clothings.all
  end
  def show
    @clothings = Clothings.find(params[:id])
  end
  def t_shirts
    @t_shirts = Clothings.where(classification: "t-shirts")
    if params[:for_whom].present?
      @t_shirts = @t_shirts.where(for_whom: params[:for_whom])
    end
  end
  def shoes
    @shoes = Clothings.where(classification: "shoes")
    if params[:for_whom].present?
      @shoes = @shoes.where(for_whom: params[:for_whom])
    end
  end
  def jackets
    @jackets = Clothings.where(classification: "jackets")
    if params[:for_whom].present?
      @jackets = @jackets.where(for_whom: params[:for_whom])
    end
  end
  def sweaters
    @sweaters = Clothings.where(classification: "sweaters")
    if params[:for_whom].present?
      @sweaters = @sweaters.where(for_whom: params[:for_whom])
    end
  end
  def business_suits
    @business_suits = Clothings.where(classification: "business_suits")
    if params[:for_whom].present?
      @business_suits = @business_suits.where(for_whom: params[:for_whom])
    end
  end
  def headwear
    @headwear = Clothings.where(classification: "headwear")
    if params[:for_whom].present?
      @headwear = @headwear.where(for_whom: params[:for_whom])
    end
  end
end
