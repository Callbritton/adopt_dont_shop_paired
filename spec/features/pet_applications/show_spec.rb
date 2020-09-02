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


    @pet_application_1 = PetApplication.create!(name: "Wilmer", address: "123 Fake Street", city: "Choco", state: "CO", zip: "80016", phone_number: "1234567", description: "I think I would make a create big brother!")

    # @pet_application_2 = PetApplication.create!(name: "Maribel", address: "123 Fake Street", city: "Choco", state: "CO", zip: "80016", phone_number: "1234567", description: "I think I would make a create big brother!")

    PetApplicationPet.create!(pet_id: @pet_1.id, pet_application_id: @pet_application_1.id)
    # PetApplicationPet.create!(pet_id: @pet_2.id, pet_application_id: @pet_application_2.id)
  end

  it "When I visit an applications show page '/applications/:id' I can see pet_application's attributes" do
    visit "/pet_applications/#{@pet_application_1.id}"

    expect(page).to have_content(@pet_application_1.name)
    # expect(page).to have_content(@pet_application_2.name)
  end
end
