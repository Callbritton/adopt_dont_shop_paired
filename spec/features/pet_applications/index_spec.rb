require 'rails_helper'

RSpec.describe "When I visit '/favorites'", type: :feature do
  before :each do
    @shelter_1 = Shelter.create(
      name: "Buck's Pet Adoption Center",
      address: "2020 Whiskey Dr",
      city: "Denver",
      state: "CO",
      zip: "80056"
    )
    @shelter_2 = Shelter.create(
      name: "Sue's Animal Shop",
      address: "23 E Wells Dr",
      city: "Denver",
      state: "CO",
      zip: "80056"
    )
    @pet_1 = @shelter_1.pets.create(
      image: "https://cdn.akc.org/content/hero/puppy_pictures_header.jpg",
      name: "Waylon",
      description: "1 year old rottie pup",
      approximate_age: 1,
      sex: "male",
      adoption_status: "available"
    )
    @pet_2 = @shelter_1.pets.create(
      image: "https://thumbs.dreamstime.com/t/lizad-20979903.jpg",
      name: "Chuck",
      description: "Lizard",
      approximate_age: 5,
      sex: "male",
      adoption_status: "available"
    )
    @pet_3 = @shelter_2.pets.create(
      image: "https://www.allaboutbirds.org/guide/assets/photo/65533521-480px.jpg",
      name: "Ducky",
      description: "Duck",
      approximate_age: 3,
      sex: "remale",
      adoption_status: "available"
    )


    @pet_application_1 = @pet_1.pet_applications.create!(name: "Wilmer", address: "123 Fake Street", city: "Choco", state: "CO", zip: "80016", phone_number: "1234567", description: "I think I would make a create big brother!")
    @pet_application_2 = @pet_3.pet_applications.create!(name: "Wilmer", address: "123 Fake Street", city: "Choco", state: "CO", zip: "80016", phone_number: "1234567", description: "I think I would make a create big brother!")
  end


    it "can create Active Record Files where the pet is available through the application and the application is available through the pet." do

      expect(@pet_application_1.pets).to eq(@pet_1)

# User Story 18, List of Pets that have applications on them
#
# As a visitor
# After one or more applications have been created
# When I visit the favorites index page
# I see a section on the page that has a list of all of the pets that have at least one application on them
# Each pet's name is a link to their show page
      visit "/favorites/index"
      within ".pet_application_pets" do
        expect(page).to have_content("#{@pet_1.name}")
        expect(page).to have_content("#{@pet_2.name}")

      end

    end
  end
