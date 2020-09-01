class PetApplicationsController < ApplicationController

  def new
  end

  def create
    pets = (params[:favorites])
    pets.each do |pet|
      integer_pet = pet.to_i
      favorites.destroy_pet(integer_pet)
    end
    redirect_to "/favorites"
    flash[:notice] = "Thank you for your application!"
    # PetApplication.new(pet_applications_params)
  end



private

  def pet_applications_params
    params.permit(:name, :address, :city, :state, :zip, :phone_number, :description)
  end

end
