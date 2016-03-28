class ProductsController < ApplicationController

  def index
  end

  def show

  end

  def count
    @products = Products.all.count
    render json: @products
  end

  def new
  end

  def create
  end

  def destroy
  end

  def update
  end

  private

  def product_params
   params.require(:product).permit(:name, :brand_id, :category_id, :price, :quantity)
  end

end
