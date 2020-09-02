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

  describe "When I visit a shelter's show page, I see a link next to each shelter review to delete the review." do
    it "When I delete a shelter review I am returned to the shelter's show page" do
      visit "shelters/#{@shelter_1.id}"

      expect(page).to have_content("#{@review_1.title}")

      within ".reviews-#{@review_1.id}" do
        expect(page).to have_link("Delete Review")
      end

      within ".reviews-#{@review_1.id}" do
        click_on 'Delete Review'
      end
      expect(page).to_not have_content("#{@review_1.title}")
    end
  end
end
