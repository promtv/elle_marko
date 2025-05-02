class ClothingsController < ApplicationController
  include Secured

  before_action :require_admin!, only: [ :destroy, :edit, :update, :create, :new ]

  def index
    @clothings = Clothing.all
  end
  def show
    @clothing = Clothing.find(params[:id])
    @average_rating = @clothing.reviews.average(:rating)&.round(1) || 0
  end
  def create
    @clothing = Clothing.new(clothing_params)
    if @clothing.save
      redirect_to @clothing, notice: "Одежда добавлена"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
  @clothing = Clothing.new
  end
  def destroy
    @clothing = Clothing.find(params[:id])
    @clothing.destroy

    redirect_to clothings_path, notice: "Одежда была успешно удалена."
  end
  def edit
    @clothing = Clothing.find(params[:id])
  end

  def update
    @clothing = Clothing.find(params[:id])
    if @clothing.update(clothing_params)
      redirect_to @clothing, notice: "Одежда успешно обновлена."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def t_shirts
    @t_shirts = Clothing.where(classification: "t-shirts")
    if params[:for_whom].present?
      @t_shirts = @t_shirts.where(for_whom: params[:for_whom])
    end
  end
  def shoes
    @shoes = Clothing.where(classification: "shoes")
    if params[:for_whom].present?
      @shoes = @shoes.where(for_whom: params[:for_whom])
    end
  end
  def jackets
    @jackets = Clothing.where(classification: "jackets")
    if params[:for_whom].present?
      @jackets = @jackets.where(for_whom: params[:for_whom])
    end
  end
  def sweaters
    @sweaters = Clothing.where(classification: "sweaters")
    if params[:for_whom].present?
      @sweaters = @sweaters.where(for_whom: params[:for_whom])
    end
  end
  def business_suits
    @business_suits = Clothing.where(classification: "business_suits")
    if params[:for_whom].present?
      @business_suits = @business_suits.where(for_whom: params[:for_whom])
    end
  end
  def headwear
    @headwear = Clothing.where(classification: "headwear")
    if params[:for_whom].present?
      @headwear = @headwear.where(for_whom: params[:for_whom])
    end
  end
  private

  def clothing_params
    params.require(:clothing).permit(
      :classification, :brand, :name, :price, :material, :size,
      :description, :for_whom, :image
    )
  end
end
