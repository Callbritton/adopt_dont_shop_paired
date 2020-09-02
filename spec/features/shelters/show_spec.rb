require 'rails_helper'

RSpec.describe 'Shelter show page', type: :feature do
  describe 'As a visitor' do
    before :each do

      @shelter_1 = Shelter.create!(name: "Willy's Animal Center",
                                   address: "2020 Whirlwind Dr",
                                   city: "Denver",
                                   state: "CO",
                                   zip: 80014)


      @pet_1 = @shelter_1.pets.create!(image: '',
                                       name: 'Waylon',
                                       approximate_age: 1,
                                       sex: 'male')
    end


    it 'can see a given shelters information' do

      visit "/shelters/#{@shelter_1.id}"
      expect(page).to have_content(@shelter_1.name)
      expect(page).to have_content(@shelter_1.address)
      expect(page).to have_content(@shelter_1.city)
      expect(page).to have_content(@shelter_1.state)
      expect(page).to have_content(@shelter_1.zip)
    end
  end
end
