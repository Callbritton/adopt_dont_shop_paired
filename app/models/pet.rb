class Pet < ApplicationRecord
  belongs_to :shelter

  after_initialize :set_defaults
  # has_one_attached :image

  validates_presence_of :name, :approximate_age, :sex
end


def set_defaults
  self.adoption_status ||= "available"
end
