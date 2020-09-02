require 'rails_helper'

RSpec.describe Pet do
  describe 'relationships' do
    it {should belong_to :shelter}
    it {should have_many :pet_application_pets}
    it {should have_many(:pet_applications).through(:pet_application_pets)}
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :approximate_age }
    it { should validate_presence_of :sex }
  end
end
