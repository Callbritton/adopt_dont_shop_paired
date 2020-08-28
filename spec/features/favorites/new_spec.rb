# User Story 9, Favorite Creation
#
# As a visitor
# When I visit a pet's show page
# I see a button or link to favorite that pet
# When I click the button or link
# I'm taken back to that pet's show page
# I see a flash message indicating that the pet has been added to my favorites list
# The favorite indicator in the nav bar has incremented by one


RSpec.describe "As a visitor when I visit a pet's show page" do
  it "I see a flash message indicating that the pet has been added to my favorites list" do
    shelter_1 = Shelter.create(
      name: "Waylon's Animal Shelter",
      address: "2020 Whirlwind DR",
      city: "Denver",
      state: "CO",
      zip: "80014"
    )

    pet_1 = shelter_1.pets.create(
      image: "https://cdn.akc.org/content/hero/puppy_pictures_header.jpg",
      name: "Duke",
      description: "A good boy",
      approximate_age: 9,
      sex: "male"
    )

    visit "/pets/#{pet_1.id}"

    click_button "Add to Favorites"
    expect(page).to have_content('Favorites: 0')
    expect(page).to have_content("You have added #{pet_1.name} to your favorites")
  end
end
