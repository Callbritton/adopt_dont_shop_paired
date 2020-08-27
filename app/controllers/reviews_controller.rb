class ReviewsController < ApplicationController


  def new
    @shelter = Shelter.find(params[:shelter_id])
  end

  def create
    @shelter = Shelter.find(params[:shelter_id])
    review = @shelter.reviews.new(review_params)
      if review.save
        redirect_to "/shelters/#{@shelter.id}"
      else
        flash[:notice] = "Form Entry Error: fill in a title, rating, and content in order to submit a shelter review"
        render :new
      end
  end

  def edit
    @review = Review.find(params[:review_id])
  end

  def update
    review = Review.find(params[:review_id])
    if review.update(review_params)
      redirect_to "/shelters/#{review.shelter.id}"
    else
      flash[:notice] = "Please ensure all required fields are completed"
      redirect_to "/reviews/#{review.id}/edit"
    end
  end


  private
  def review_params
    params.permit(:title, :rating, :content, :optional_picture)
  end

end
