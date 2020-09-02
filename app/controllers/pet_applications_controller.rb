class PetApplicationsController < ApplicationController

  def new
  end

  def create
    pet_app = PetApplication.new(pet_applications_params
    )

    if pet_app.save
      (params[:favorites]).map do |pet_id_str|
          pet_app.pet_application_pet_ids << pet_id_str.to_i



          favorites.destroy_pet(pet_id_str.to_i)
        end
      redirect_to "/favorites"
      flash[:notice] = "Thank you for your application!"
    else
      flash[:notice] = "Form Entry Error: fill in all fields in order to submit application"
      render :new
    end
  end

private

  def pet_applications_params
    params.permit(:name, :address, :city, :state, :zip, :phone_number, :description)
  end

end

#
# pet_app.favorites.each do |favorite|
#   link_to (Pet.find(favorite.to_i)).name
# end
