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
             sex: 'male',
             )
    end

    it 'can update or delete pets from the shelter show pets page' do

      visit "/shelters/#{@shelter_1.id}/pets"

      expect(page).to have_link("Update Pet", href: "/pets/#{@pet_1.id}/edit")
      expect(page).to have_link("Delete Pet", href: "/pets/#{@pet_1.id}")
    end
  end
end
