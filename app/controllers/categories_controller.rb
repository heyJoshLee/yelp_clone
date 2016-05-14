class CategoriesController < ApplicationController

  before_filter :require_user, only: [:new]

  def index
    @categories = Category.all
  end


  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save 
      redirect_to @category
    else
      flash[:danger] = "Something went wrong"
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit!
  end
    

end