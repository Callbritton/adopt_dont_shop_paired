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

    click_link 'Delete Shelter'

    expect(current_path).to eq('/shelters')
    expect(page).to_not have_content(shelter_1.name)
  end
end
