class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if Category.find_by(title: category_params[:title]) != nil
      flash[:alert] = "Category with the title: #{@category.title} already exists! You can create a new one."
      redirect_to new_category_path
    else
      @category.save
      flash[:success] = "new category created with title: #{@category.title}"
      redirect_to category_path(@category)
    end
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
