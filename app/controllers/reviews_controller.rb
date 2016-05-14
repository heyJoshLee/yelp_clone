class ReviewsController < ApplicationController

  before_filter :require_user, only: [:create]

  def create
    @business = Business.find(params[:business_id])
    @review = @business.reviews.build(review_params)
    @review.user = current_user
    if @review.save
      redirect_to business_path(Business.find(params[:business_id]))
    else
      flash[:danger] = "This was an error"
      render "businesses/show"
    end
  end

  private

  def review_params
    params.require(:review).permit!
  end

end