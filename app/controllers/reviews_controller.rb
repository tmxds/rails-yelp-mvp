class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @restaurant = set_restaurant
    @review = Review.new
  end

  def create
    @restaurant = set_restaurant
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

  def set_restaurant
    Restaurant.find(params[:restaurant_id])
  end
end
