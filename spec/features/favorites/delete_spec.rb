require "rails_helper"
# User Story 12, Can't Favorite a Pet More Than Once
# As a visitor
# When I visit that pet's show page
# After I've favorited a pet
# I no longer see a link to favorite that pet
# But I see a link to remove that pet from my favorites
# When I click that link
# A delete request is sent to "/favorites/:pet_id"
# And I'm redirected back to that pets show page where I can see a flash message indicating that the pet was removed from my favorites
# And I can now see a link to favorite that pet
# And I also see that my favorites indicator has decremented by 1

RSpec.describe "As a visitor When I visit that pet's show page After I've favorited a pet" do
  it "Can no longer see a link to favorite that pet" do
    shelter_1 = Shelter.create(
      name: "Waylon's Animal Shelter",
      address: "2020 Whirlwind DR",
      city: "Denver",
      state: "CO",
      zip: "80014")

    pet_1 = shelter_1.pets.create(
      image: "https://cdn.akc.org/content/hero/puppy_pictures_header.jpg",
      name: "Duke",
      description: "A good boy",
      approximate_age: 9,
      sex: "male"
    )

    visit "/pets/#{pet_1.id}"
    expect(page).to have_button('Add to Favorites')

    click_button 'Add to Favorites'
    expect(page).to have_content('Favorites: 1')
    expect(page).to have_content("You have added #{pet_1.name} to your favorites")
    expect(page).to have_button('Add to Favorites', disabled: true)
    expect(page).to have_button('Remove from Favorites')

    click_button 'Remove from Favorites'
    expect(page).to have_content('Favorites: 0')
    expect(page).to have_content("#{pet_1.name} has been removed from your favorites")
    expect(page).to have_button('Remove from Favorites', disabled: true)
    expect(page).to have_button('Add to Favorites')

  end
end
