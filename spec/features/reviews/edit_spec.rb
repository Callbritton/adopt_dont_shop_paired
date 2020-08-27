# As a visitor,
# When I visit a shelter's show page
# I see a link to edit the shelter review next to each review.
# When I click on this link, I am taken to an edit shelter review path
# On this new page, I see a form that includes that review's pre populated data:
# - title
# - rating
# - content
# - image
# I can update any of these fields and submit the form.
# When the form is submitted, I should return to that shelter's show page
# And I can see my updated review
require 'rails_helper'

RSpec.describe 'As a visitor' do
    before :each do

    @shelter_1 = Shelter.create!(
      name: "Willy's Animal Center",
      address: "2020 Whirlwind Dr",
      city: "Denver",
      state: "CO",
      zip: 80014)

    @review_1 = @shelter_1.reviews.create!(
      title: "My favorite dr",
      rating: "5",
      content: "Love coming here with my pet",
      optional_picture: "")

    @review_2 = @shelter_1.reviews.create!(
      title: "Overpriced!",
      rating: "2",
      content: "Terrible customer service for the money",
      optional_picture: "")
    end

    describe "When I visit a shelter's show page" do
      describe "I see a link to edit the shelter review" do
        it "When I click on this link, I am taken to an edit shelter review path" do

        visit "/shelters/#{@shelter_1.id}"

        within ".reviews-#{@review_1.id}" do
          expect(page).to have_link("Edit Review")
        end

        within ".reviews-#{@review_1.id}" do
          click_on 'Edit Review'
        end

        expect(page).to have_current_path "/shelters/#{@shelter_1.id}/reviews/edit"
      end
    end
  end
end


      # click_on 'Add Review'
      #
      # expect(page).to have_current_path "/shelters/#{@shelter_1.id}/reviews/new"
      #
      # fill_in "Title", with: "The best shelter I have ever visited!"
      # fill_in "Rating", with: "4"
      # fill_in "Content", with: "Dr. Willy was so kind and welcoming."
      #
      # click_on "Submit Review"
      #
      # expect(page).to have_current_path "/shelters/#{@shelter_1.id}"
      # expect(page).to have_content ("The best shelter I have ever visited!")
      # expect(page).to have_content ("4")
      # expect(page).to have_content ("Dr. Willy was so kind and welcoming.")
