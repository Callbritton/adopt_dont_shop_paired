require "rails_helper"

RSpec.describe "As a vistor When I have added a pet to my favorite list" do
  it "I can visit the favorite index page and see all my favorite pets" do
    shelter_1 = Shelter.create(
      name: "Bills Animal Center",
      address: "2987 Woot Blvd",
      city: "Denver",
      state: "CO",
      zip: "88765"
    )
    pet_1 = shelter_1.pets.create(
      image: "https://cf.ltkcdn.net/dogs/images/orig/235430-2000x1332-australian-shepherd-puppy.jpg",
      name: "Buck",
      description: "Lil pup",
      approximate_age: 1,
      sex: "male"
    )
    pet_2 = shelter_1.pets.create(
      image: "https://image.shutterstock.com/image-photo/portrait-surprised-cat-scottish-straight-260nw-499196506.jpg",
      name: "Sunny",
      description: "cute kitty",
      approximate_age: "2",
      sex: "female"
    )

    visit "/pets/#{pet_1.id}"

    expect(page).to have_button('Add to Favorites')
    click_button "Add to Favorites"
    expect(page).to have_content("You have added #{pet_1.name} to your favorites")
    expect(page).to have_content("Favorites: 1")
    
    visit "/pets/#{pet_1.id}"
    expect(page).to_not have_button("Add to Favorites")
  end
end
