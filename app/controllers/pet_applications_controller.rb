class PetApplicationsController < ApplicationController

  def new
  end

  def create
    pet_app = PetApplication.new(pet_applications_params)
    require "pry"; binding.pry
    if pet_app.save
      pets = (params[:favorites])
      pets.each do |pet|
        integer_pet = pet.to_i
        favorites.destroy_pet(integer_pet)
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
    params.permit(:name, :address, :city, :state, :zip, :phone_number, :description, :favorites)
  end

end

#
# pet_app.favorites.each do |favorite|
#   link_to (Pet.find(favorite.to_i)).name
# end
