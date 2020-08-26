class ReviewsController < ApplicationController


  def new
    @shelter = Shelter.find(params[:shelter_id])
  end

  def create
    shelter = Shelter.find(params[:shelter_id])
    review = shelter.reviews.new(review_params)
    review.save
    redirect_to "/shelters/#{params[:shelter_id]}"
  end




  private

  def review_params
    params.permit(:title, :rating, :content, :optional_picture)
  end
end
