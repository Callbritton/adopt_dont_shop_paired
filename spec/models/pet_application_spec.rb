require 'rails_helper'

# User Story 17, Incomplete application for a Pet
#
# As a visitor
# When I apply for a pet and fail to fill out any of the following:
# - Name
# - Address
# - City
# - State
# - Zip
# - Phone Number
# - Description of why I'd make a good home for this/these pet(s)
# And I click on a button to submit my application
# I'm redirect back to the new application form to complete the necessary fields
# And I see a flash message indicating that I must complete the form in order to submit the application


  RSpec.describe PetApplication, type: :model do
    describe "validations" do
      it { should validate_presence_of :name}
      it { should validate_presence_of :address}
      it { should validate_presence_of :city}
      it { should validate_presence_of :state}
      it { should validate_presence_of :zip}
      it { should validate_presence_of :phone_number}
      it { should validate_presence_of :description}

    end
  end
