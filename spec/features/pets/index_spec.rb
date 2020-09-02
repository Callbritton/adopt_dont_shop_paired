require 'rails_helper'

RSpec.describe "pets index page", type: :feature do

  it "can see pets" do
    shelter_1 = Shelter.create!(name: "shelter_1",
                                address: "123 blvd",
                                city: "testville",
                                state: "WY",
                                zip: 12345)

    # pet_1 = Pet.create!(image: "",
    #                     name: "Waylon",
    #                     approximate_age: 1,
    #                     sex: "male",
    #                     shelter: shelter_1)
    pet_1 = shelter_1.pets.create!(image: "",
                        name: "Waylon",
                        approximate_age: 1,
                        sex: "male",
                        shelter: shelter_1)
                        require "pry"; binding.pry
    visit "/pets"

    expect(page).to have_content(pet_1.name)
  end

  it "can update pets from the pets index" do
    shelter_1 = Shelter.create!(name: "shelter_1",
                                address: "123 blvd",
                                city: "testville",
                                state: "WY",
                                zip: 12345)

    pet_1 = shelter_1.pets.create(
      image: "http://cdn.akc.org/content/article-body-image/golden_puppy_dog_pictures.jpg",
      name: "Duke",
      description: "Gentle lab that loves kids",
      approximate_age: 9,
      sex: "male"
    )

    visit "/pets"
    expect(page).to have_link("Update Pet", href: "/pets/#{pet_1.id}/edit")
    expect(page).to have_link("Delete Pet", href: "/pets/#{pet_1.id}")
  end
end
