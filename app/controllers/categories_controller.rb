class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    redirect_to category_path(@category)
  end

  def show
    @category = Category.find(params[:id])
    #redirect_to category_path(category)
  end

  def index
    @categories = Category.all
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)

    redirect_to categories_path
  end

  def destroy
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

end
