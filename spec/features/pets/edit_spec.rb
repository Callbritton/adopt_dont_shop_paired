require 'rails_helper'

RSpec.describe "As a visitor When I visit the pet show page" do
  it "Then I see a link to update that Pet" do
    shelter_1 = Shelter.create(
      name: "Waylon's Animal Shelter",
      address: "2020 Whirlwind DR",
      city: "Denver",
      state: "CO",
      zip: "80014"
    )
    pet_1 = shelter_1.pets.create(
      image: "http://cdn.akc.org/content/article-body-image/golden_puppy_dog_pictures.jpg",
      name: "Duke",
      description: "Gentle lab that loves kids",
      approximate_age: 9,
      sex: "male"
    )
    visit "/pets/#{pet_1.id}"

    click_on 'Update Pet'

    expect(page).to have_current_path "/pets/#{pet_1.id}/edit"

    fill_in :name, with: "Charles"
    fill_in :image, with: "http://cdn.akc.org/content/article-body-image/golden_puppy_dog_pictures.jpg"
    fill_in :description, with: "Gentle lab that loves kids"
    fill_in :approximate_age, with: 6
    fill_in :sex, with: 'male'

    click_on 'Update Pet'

    expect(page).to have_current_path "/pets/#{pet_1.id}"

    expect(page).to have_content ("Charles")
    expect(page).to have_content (6)
    expect(page).to_not have_content ("Duke")
    expect(page).to_not have_content (9)
  end
end
