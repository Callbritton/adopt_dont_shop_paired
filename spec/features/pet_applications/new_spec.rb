
# User Story 16, Applying for a Pet
#
# As a visitor
# When I have added pets to my favorites list
# And I visit my favorites page ("/favorites")
# I see a link for adopting my favorited pets
# When I click that link I'm taken to a new application form

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
    end

    it "When I have added pets to my favorites list, And I visit my favorites page ('/favorites'), I see a link for adopting my favorited pets, When I click that link I'm taken to a new application form" do
      visit "/pets/#{@pet_1.id}"
      click_button "Add to Favorites"

      visit "/pets/#{@pet_2.id}"
      click_button "Add to Favorites"

      visit "/pets/#{@pet_3.id}"
      click_button "Add to Favorites"

      visit "/favorites"
      expect(page).to have_link("Adopt my favorite pets")

      click_link "Adopt my favorite pets"

      expect(page).to have_current_path "/favorites/pet_applications/new"

    end


    # At the top of the form, I can select from the pets of which I've favorited for which I'd like this application to apply towards (can be more than one)
    # When I select one or more pets, and fill in my
    # - Name
    # - Address
    # - City
    # - State
    # - Zip
    # - Phone Number
    # - Description of why I'd make a good home for this/these pet(s)
    # And I click on a button to submit my application
    # I see a flash message indicating my application went through for the pets that were selected
    # And I'm taken back to my favorites page where I no longer see the pets for which I just applied listed as favorites

#FOR TESTS
    # fill_in 'Name', with: 'Denver Animal Shelter'
    # fill_in 'Address', with: '1241 W Bayaud Ave'
    # fill_in 'City', with: 'Denver'
    # fill_in 'State', with: 'CO'
    # fill_in 'Zip', with: '80223'
    # click_on 'Create Shelter'
    #
    # expect(page).to have_current_path "/shelters"
    # expect(page).to have_content ('Denver Animal Shelter')
  end
