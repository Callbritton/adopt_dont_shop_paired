require "rails_helper"

RSpec.describe "Favorites" do
  before :each do
    @shelter_1 = Shelter.create(
      name: "Waylon's Animal Shelter",
      address: "2020 Whirlwind DR",
      city: "Denver",
      state: "CO",
      zip: "80014"
    )

    @pet_1 = @shelter_1.pets.create(
      image: "https://cdn.akc.org/content/hero/puppy_pictures_header.jpg",
      name: "Duke",
      description: "A good boy",
      approximate_age: 9,
      sex: "male"
    )
  end

    it "I see a favorite indicator in my navigation bar" do

    visit "/pets/#{@pet_1.id}"
    expect(page).to have_content('Favorites: 0')

    visit "/pets"
    expect(page).to have_content('Favorites: 0')

    visit "/shelters"
    expect(page).to have_content('Favorites: 0')

    visit "/shelters/#{@shelter_1.id}"
    expect(page).to have_content('Favorites: 0')
  end
end
