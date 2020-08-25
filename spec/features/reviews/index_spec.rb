require "rails_helper"

RSpec.describe "Review" do
  describe 'relationships' do
    it {should belong_to :shelter}
  end
# User Story 2, Shelter Reviews

# As a visitor,
# When I visit a shelter's show page,
# I see a list of reviews for that shelter
# Each review will have:
# - title
# - rating
# - content
# - an optional picture
end
