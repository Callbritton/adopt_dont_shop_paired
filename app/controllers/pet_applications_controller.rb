class PetApplicationsController < ApplicationController

  def new
  end

  def create
    # pets = Pet.find(params[:favorites])
    PetApplication.new(pet_applications_params)
  end



private

  def pet_applications_params
    params.permit(:name, :address, :city, :state, :zip, :phone_number, :description, :favorites)
  end

end
