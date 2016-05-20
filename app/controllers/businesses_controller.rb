class BusinessesController < ApplicationController
  before_filter :require_user, only: [:new, :create]

 
  def new
    @business = Business.new
  end

  def show
    @review = Review.new
    @business = Business.find(params[:id])
  end

   def index
    @reviews = Review.recent_reviews
    @businesses = Business.all
  end


  def create
    @business = Business.new(business_params)

    if @business.save 
      flash[:success] = "Business was created"
      redirect_to business_path(@business)
    else
      flash[:danger] = "There was an error"
      render :new
    end
  end

  def business_params
    params.require(:business).permit!
  end

end