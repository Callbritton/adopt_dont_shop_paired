class ReviewsController < ApplicationController


  def new
    @shelter = Shelter.find(params[:shelter_id])
  end

  def create
    shelter = Shelter.find(params[:shelter_id])
    review = shelter.reviews.new(review_params)
      if review.save
        redirect_to "/shelters/#{params[:shelter_id]}"
      else
        flash[:notice] = "Form Entry Error: fill in a title, rating, and content in order to submit a shelter review"
        render :new
      end
  end




  private
  def review_params
    params.permit(:title, :rating, :content, :optional_picture)
  end

end
