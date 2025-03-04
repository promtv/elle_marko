class ClothingsController < ApplicationController
  def index
    @clothings = Clothings.all
  end
  def show
    @clothings = Clothings.find(params[:id])
  end
  def t_shirts
    @t_shirts = Clothings.where(classification: "t-shirts")
  end
  def shoes
    @shoes = Clothings.where(classification: "shoes")
  end
  def jackets
    @jackets = Clothings.where(classification: "jackets")
  end
  def sweaters
    @sweaters = Clothings.where(classification: "sweaters")
  end
  def business_suits
    @business_suits = Clothings.where(classification: "business_suits")
  end
  def headwear
    @headwear = Clothings.where(classification: "headwear")
  end
end