class PetApplication < ApplicationRecord

  validates_presence_of :name, :address, :city, :state, :zip, :phone_number, :description

  has_many :pets, through: :pet_application_pets
  has_many :pet_application_pets

end
