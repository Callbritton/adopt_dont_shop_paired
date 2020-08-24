require "rails_helper"

RSpec.describe "As a visitor When I visit a shelters page" do
  it "I can update a shelter" do
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

    click_link 'Delete Pet'

    expect(current_path).to eq('/pets')
    expect(page).to_not have_content(pet_1.name)
  end
end
