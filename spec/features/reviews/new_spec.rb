require 'rails_helper'

# User Story 3, Shelter Review Creation
#
# As a visitor,
# When I visit a shelter's show page
# I see a link to add a new review for this shelter.
# When I click on this link, I am taken to a new review path
# On this new page, I see a form where I must enter:
# - title
# - rating
# - content
# I also see a field where I can enter an optional image (web address)
# When the form is submitted, I should return to that shelter's show page
# and I can see my new review

RSpec.describe 'As a visitor' do
    before :each do

    @shelter_1 = Shelter.create!(name: "Willy's Animal Center",
                          address: "2020 Whirlwind Dr",
                          city: "Denver",
                          state: "CO",
                          zip: 80014)
    end
    describe "When I visit a shelter's show page" do
    it "can create a new review" do

      visit "/shelters/#{@shelter_1.id}"

      click_on 'Add Review'

      expect(page).to have_current_path "/shelters/#{@shelter_1.id}/reviews/new"

      fill_in "Title", with: "The best shelter I have ever visited!"
      fill_in "Rating", with: "4"
      fill_in "Content", with: "Dr. Willy was so kind and welcoming."
      fill_in "Image", with: ""

      click_on "Submit Review"

      expect(page).to have_current_path "/shelters/#{@shelter_1.id}"
      expect(page).to have_content ("The best shelter I have ver visited!")
      expect(page).to have_content ("4")
      expect(page).to have_content ("Dr. Willy was so kind and welcoming.")
    end
  end
end
