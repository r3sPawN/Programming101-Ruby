class CategoriesController < ApplicationController

  def index
    render json: Category.all
  end

  def create
    @category = Category.create!(category_params)

    render json: @category
  end

  def count
    @categories = Category.all.count
    render json: @categories
  end

  def edit
    @category = Category.find(params[:id])
  end

  def destroy
    @category= Category.find(params[:id])
    @categiry.destroy

    redirect_to index_path
  end

  private
  def category_params
     params.require(:category).permit(:title)
  end

end
