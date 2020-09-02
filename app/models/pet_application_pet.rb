class PetApplicationPet < ApplicationRecord
  belongs_to :pet
  belongs_to :pet_application

  # def pets_with_applications
  #   pets_w_apps = PetApplicationPet.all
  #   require "pry"; binding.pry
  #
  # end
end
