class PetApplicationsController < ApplicationController

  def new
  end

  def create
    pet_app = PetApplication.new(pet_applications_params
    )

    if pet_app.save
      (params[:favorites]).map do |pet_id_str|
        pet = pet_id_str.to_i

          PetApplicationPet.create(pet_id: pet, pet_application_id: pet_app.id)

          favorites.destroy_pet(pet_id_str.to_i)
        end
      redirect_to "/favorites"
      flash[:notice] = "Thank you for your application!"
    else
      flash[:notice] = "Form Entry Error: fill in all fields in order to submit application"
      render :new
    end
  end

  def index
  end

  def show
    @pet_application = PetApplication.find(params[:pet_application_id])
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
