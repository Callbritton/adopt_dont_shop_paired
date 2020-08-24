require 'rails_helper'

RSpec.describe "When I visit '/pets/:id'", type: :feature do
  it "I see the pet with that id" do
    shelter_1 = Shelter.create(
      name: "Willy's Animal Center",
      address: "2020 Whirlwind Dr",
      city: "Denver",
      state: "CO",
      zip: "80056"
    )
    pet_1 = shelter_1.pets.create(
      image: "",
      name: "Waylon",
      description: "1 year old rottie pup",
      approximate_age: 1,
      sex: "male",
      adoption_status: "available"
    )
    visit "/pets"
    click_link "#{pet_1.name}"

    expect(current_path).to eq("/pets/#{pet_1.id}")
  end
end
