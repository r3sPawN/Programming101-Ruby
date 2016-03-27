class BrandsController < ApplicationController
  def index
   @brand = Brand.find(params[:id])
   render json: @brand
  end

  def new
    @brand = Brand.new
    render :nothing => true
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save!
      render json: @brand
    end
  end

  def show
    @brands = Brand.all
    render json: @brands
  end

  def count
    numb = 0
    @brands = Brand.all
    @brands.each do
      numb += 1
    end
    render json: numb
  end

  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy

    redirect_to brand_path
  end

  private
  def brand_params
    params.require(:brand).permit(:name, :info)
  end
end
