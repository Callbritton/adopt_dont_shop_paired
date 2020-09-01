require 'rails_helper'

RSpec.describe Favorite do

  describe "#total_count" do
    it "can calculate the total number of favorited pets" do
      favorite = Favorite.new([1,2])
      expect(favorite.total_count).to eq(2)
    end
  end

  describe "#add_pet" do
    it "can add a pet" do
    @shelter_1 = Shelter.create!(name: "Willy's Animal Center",
     address: "2020 Whirlwind Dr",
     city: "Denver",
     state: "CO",
     zip: 80014)


    @pet_1 = @shelter_1.pets.create!(image: '',
     name: 'Waylon',
     approximate_age: 1,
     sex: 'male',
     )
      favorite = Favorite.new(["#{@pet_1.id}"])
      favorite.add_pet(@pet_1)
      expect(favorite.total_count).to eq(2)
    end

  end

end
