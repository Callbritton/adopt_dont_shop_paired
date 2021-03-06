require 'rails_helper'

  RSpec.describe PetApplication, type: :model do
    describe "validations" do
      it { should validate_presence_of :name}
      it { should validate_presence_of :address}
      it { should validate_presence_of :city}
      it { should validate_presence_of :state}
      it { should validate_presence_of :zip}
      it { should validate_presence_of :phone_number}
      it { should validate_presence_of :description}

      it {should have_many(:pets).through(:pet_application_pets)}
    end
  end
