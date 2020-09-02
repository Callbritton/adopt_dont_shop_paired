require 'rails_helper'

RSpec.describe "creating a new pet" do
  it "can create a pet" do
    shelter_1 = Shelter.create!(name: "Willy's Animal Center",
                                address: "2020 Whirlwind Dr",
                                city: "Denver",
                                state: "CO",
                                zip: 80014)
    image = ""
    name = "Waylon"
    description = "1 year old rottie puppy"
    approximate_age = 1
    sex = "male"

    visit "/shelters/#{shelter_1.id}/pets/new"

    fill_in :image, with: image
    fill_in :name, with: name
    fill_in :description, with: description
    fill_in :approximate_age, with: approximate_age
    fill_in :sex, with: sex

    click_on "Create Pet"

    new_pet = Pet.last

    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
    expect(page).to have_content(new_pet.approximate_age)
    expect(page).to have_content(new_pet.image)
    expect(page).to have_content(new_pet.sex)
    expect(page).to have_content(shelter_1.name)
  end
end
