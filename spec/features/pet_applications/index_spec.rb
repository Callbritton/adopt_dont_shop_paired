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
    visit "/pets/#{@pet_1.id}"
    click_button "Add to Favorites"

    visit "/pets/#{@pet_2.id}"
    click_button "Add to Favorites"

    visit "/pets/#{@pet_3.id}"
    click_button "Add to Favorites"


    @pet_application_1 = @pet_3.pet_applications.create!(name: "Wilmer", address: "123 Fake Street", city: "Choco", state: "CO", zip: "80016", phone_number: "1234567", description: "I think I would make a create big brother!")

    end


    it "can create Active Record Files where the pet is available through the application and the application is available through the pet." do
      visit "/favorites"

      click_link "Adopt my favorite pets"

      expect(page).to have_current_path "/favorites/pet_applications/new"

      find(:css, "#favorites_[value='#{@pet_1.id}']").set(true)
      find(:css, "#favorites_[value='#{@pet_2.id}']").set(true)

      fill_in 'Name', with: 'Christopher'
      fill_in 'Address', with: '1241 W Bayaud Ave'
      fill_in 'City', with: 'Denver'
      fill_in 'State', with: 'CO'
      fill_in 'Zip', with: '80223'
      fill_in 'Phone number', with: '312-333-3333'
      fill_in 'Description', with: 'I think I would be a good home because wob whon whonw wonw wown.'

      click_on 'Submit'

      expect(page).to have_current_path "/favorites"


    end
  end
