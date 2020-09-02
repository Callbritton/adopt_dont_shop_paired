class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :pet_application_pets
  has_many :pet_applications, through: :pet_application_pets

  after_initialize :set_defaults

  validates_presence_of :name, :approximate_age, :sex
end


def set_defaults
  self.adoption_status ||= "available"
end
