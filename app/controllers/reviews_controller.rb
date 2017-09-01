class ReviewsController < ApplicationController
  def create
    @product = Product.find_by(:id => params[:product_id])
    @review = Review.new(review_params)
    @review.user = User.find_by(:id => session[:user_id])
  
    @product.reviews.push(@review)
    @product.save
    redirect_to product_path(params[:product_id])
  end
  def review_params
    params[:product][:reviews].permit(:description, :rating)
  end
end
