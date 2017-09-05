class ReviewsController < ApplicationController
  def create
    @product = Product.find_by(:id => params[:product_id])
    @review = Review.new(review_params)
    @review.user = User.find_by(:id => @current_user)

    @product.reviews.push(@review)
    if @product.save!
      redirect_to product_path(params[:product_id])
    else
      flash[:notice] = "You must be logged in to post reviews"
      redirect_to @product
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])

  if @review.user.id === current_user
    @review.destroy
    flash[:notice] = "Review was removed"
    redirect_to @product
  else
    flash[:notice] = "There was an error removing review"
    redirect_to @product
  end
end


  def review_params
    params[:product][:reviews].permit(:description,,

  :rating)
  end
end
