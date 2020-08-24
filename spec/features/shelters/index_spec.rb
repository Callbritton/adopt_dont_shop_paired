require 'rails_helper'
RSpec.describe 'Shelters index page' do
  before :each do

    @shelter_1 = Shelter.create!(name: "Willy's Animal Center",
                          address: "2020 Whirlwind Dr",
                          city: "Denver",
                          state: "CO",
                          zip: 80014)
    @shelter_2 = Shelter.create!(name: "Sue's Shelter",
                          address: "4478 Wandering St",
                          city: "Timbucktoo",
                          state: "NV",
                          zip: 76890)
  end

  describe 'it in more details' do

      it "I see each shelter's name" do
        visit '/shelters'

        expect(page).to have_content(@shelter_1.name)
        expect(page).to have_content(@shelter_2.name)
      end

      it 'I see the addresses' do
        visit '/shelters'

        expect(page).to have_content(@shelter_1.address)
        expect(page).to have_content(@shelter_2.address)
    end
  end

  describe "it can edit and delete shelters from the index page" do

    it "I can update or delete a shelter" do

      visit "/shelters"

      expect(page).to have_link("Update Shelter", href: "/shelters/#{@shelter_1.id}/edit")
      expect(page).to have_link('Delete Shelter', href: "/shelters/#{@shelter_1.id}")
    end
  end

end
