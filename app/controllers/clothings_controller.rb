class ClothingsController < ApplicationController
  include Secured

  before_action :require_admin!, only: [ :destroy, :edit, :update, :create, :new ]

  def index
    @sort_field = %w[price name].include?(params[:sort_by]) ? params[:sort_by] : "price"
    @sort_order = params[:sort] == "desc" ? "desc" : "asc"
    @clothings = Clothing.all

    if params[:for_whom].present?
      @clothings = @clothings.where(for_whom: params[:for_whom])
    end
    if params[:category].present?
      @clothings = @clothings.where(classification: params[:category])
    end

    @clothings = @clothings.order(@sort_field => @sort_order)
  end

  def show
    @clothing = Clothing.find(params[:id])
    @average_rating = @clothing.reviews.average(:rating)&.round(1) || 0
  end

  def search
    if params[:q].present?
      query = "%#{params[:q]}%"
      @clothings = Clothing.where("name LIKE ? OR brand LIKE ? OR material LIKE ?", query, query, query)
    else
      @clothings = []
    end
  end
  def autocomplete
    query = params[:q].to_s.strip
    results = Clothing.where("name LIKE ? OR brand LIKE ?", "%#{query}%", "%#{query}%").limit(5)

    render json: results.select(:id, :name, :brand)
  end

  def create
    @clothing = Clothing.new(clothing_params)
    if @clothing.save
      redirect_to @clothing
    else
      render :new, status: :unprocessable_entity
    end
  end

  def admin_page
    @clothings = Clothing.all
  end

  def new
    @clothing = Clothing.new
  end

  def destroy
    @clothing = Clothing.find(params[:id])
    @clothing.destroy

    redirect_to admin_page_clothings_path
  end

  def edit
    @clothing = Clothing.find(params[:id])
  end

  def update
    @clothing = Clothing.find(params[:id])
    if @clothing.update(clothing_params)
      redirect_to @clothing
    else
      render :edit, status: :unprocessable_entity
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
