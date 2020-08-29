require 'rails_helper'

RSpec.describe "When I visit '/pets/:id'", type: :feature do
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

    # User Story 10, Favorite Index Page
    #
    # As a visitor
    # When I have added pets to my favorites list
    # And I visit my favorites index page ("/favorites")
    # I see all pets I've favorited
    # Each pet in my favorites shows the following information:
    # - pet's name (link to pets show page)
    # - pet's image

    it "I visit my favorites index page ('/favorites') I see all pets I've favorited" do
    visit "/pets/#{@pet_1.id}"
    click_button "Add to Favorites"

    visit "/pets/#{@pet_2.id}"
    click_button "Add to Favorites"

    visit "/pets/#{@pet_3.id}"
    click_button "Add to Favorites"

    visit "/favorites"
    expect(current_path).to eq("/favorites")
    expect(page).to have_content("#{@pet_1.name}")
    # expect(page).to have_content("#{@pet_1.image}")

    expect(page).to have_content("#{@pet_2.name}")
    # expect(page).to have_content("#{@pet_2.image}")

    expect(page).to have_content("#{@pet_3.name}")
    # expect(page).to have_content("#{@pet_3.image}")

  end
end
