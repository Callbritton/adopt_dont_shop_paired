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

        expect(page).to have_current_path "/reviews/#{@review_1.id}/edit"
      end
    end

    describe "On this new page, I see a form that includes that review's pre populated data" do
      it "the data from creation is prepopulated" do
        visit("/reviews/#{@review_1.id}/edit")

        expect(find_field('Title').value).to eq(@review_1.title)
        expect(find_field('Rating').value).to eq(@review_1.rating.to_s)
        expect(find_field('Content').value).to eq(@review_1.content)
        # expect(find_field('Optional Picture').value).to eq(@review_1.optional_picture)
      end

      it "I can update any of these fields and submit the form" do
        visit("/reviews/#{@review_1.id}/edit")

        fill_in 'Title', with: "If I could give 0 stars I would"
        fill_in 'Rating', with: 1
        fill_in 'Content', with: "This place is the worst business in town! My wife Karen and I hate it."
        # fill_in 'Optional Picture', with: ""

        click_button 'Edit Review'
        expect(current_path).to eq("/shelters/#{@review_1.shelter.id}")
      end
    end
  end
end
