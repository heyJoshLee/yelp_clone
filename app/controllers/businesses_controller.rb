class BusinessesController < ApplicationController
  before_filter :require_user, only: [:new]

 
  def new
    @business = Business.new
  end

  def show
    @business = Business.find(params[:id])
    
  end

   def index
    @businesses = Business.all
  end


  def create
    @business = Business.new(business_params)

    if @business.save 
      redirect_to businesses_path(@business)
    else
      redirect_to root_path
    end
  end

  def business_params
    params.require(:business).permit!
  end

end