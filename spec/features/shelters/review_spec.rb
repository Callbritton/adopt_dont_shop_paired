require 'rails_helper'
RSpec.describe 'Shelter Reviews' do
  before :each do

    @shelter_1 = Shelter.create!(name: "Willy's Animal Center",
                          address: "2020 Whirlwind Dr",
                          city: "Denver",
                          state: "CO",
                          zip: 80014)
    @review_1 = @shelter_1.reviews.create!(title: "This place is great!", rating: "5", content: "We found our puppy love", optional_picture: "This is a picture")
  end

  describe 'As visitor' do

      it "I see a list of reviews for that shelter" do
        visit "/shelters/#{shelter_1.id}"
        # As a visitor,
        # When I visit a shelter's show page,
        # I see a list of reviews for that shelter
        # Each review will have:
        # - title
        # - rating
        # - content
        # - an optional picture

        expect(page).to have_content(@review_1.title)
        expect(page).to have_content(@review_1.rating)
        expect(page).to have_content(@review_1.content)
        expect(page).to have_content(@review_1.optional_picture)

      end
    end
  end
