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
    visit "/shelters/#{shelter_1.id}"
    click_link "Update Shelter"

    expect(page).to have_current_path "/shelters/#{shelter_1.id}/edit"

    fill_in "Name", with: "Willy's Animal House"
    fill_in "Address", with: "4467 Dog House Ln"
    fill_in "City", with: "Denver"
    fill_in "State", with: "CO"
    fill_in "Zip", with: "88976"
    click_on "Submit Changes"

    expect(page).to have_current_path "/shelters/#{shelter_1.id}"
    expect(page).to have_content ("Willy's Animal House")
  end
end
