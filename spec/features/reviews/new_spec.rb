require 'rails_helper'


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

      click_on "Submit Review"

      expect(page).to have_current_path "/shelters/#{@shelter_1.id}"
      expect(page).to have_content ("The best shelter I have ever visited!")
      expect(page).to have_content ("4")
      expect(page).to have_content ("Dr. Willy was so kind and welcoming.")
    end

    it 'I cannot create a review without a title' do

      visit "/shelters/#{@shelter_1.id}"

      click_on 'Add Review'

      expect(page).to have_current_path "/shelters/#{@shelter_1.id}/reviews/new"

      click_on 'Submit Review'

      expect(page).to have_conent("Form Entry Error: fill in a title, rating, and content in order to submit a shelter review")

      expect(page).to have_current_path "/shelters/#{@shelter_1.id}/reviews/new"

      expect(page).to have_button('Submit Review')
    end
  end
end
