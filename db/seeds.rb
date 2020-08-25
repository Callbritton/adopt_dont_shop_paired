# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
shelter_1 = Shelter.create!(name: "Willy's Animal Center",
                             address: "2020 Whirlwind Dr",
                             city: "Denver",
                             state: "CO",
                             zip: 80014)

shelter_2 = Shelter.create!(name: "Wilmer's Place",
                            address: "123 Fake St",
                            city: "Chicago",
                            state: "IL",
                            zip: 60651)

shelter_3 = Shelter.create!(name: "Luna's Animal Sanctuary",
                            address: "3456 Lost Place",
                            city: "Peoria",
                            state: "IL",
                            zip: 60564)

pet_1 = shelter_1.pets.create!(image: "https://i.pinimg.com/236x/23/4d/b2/234db2abd5a83b872c345335fb9a4933--baby-rottweiler-cutest-puppy.jpg",
                              name: "Waylon",
                              description: "1 year old rottie pup",
                              approximate_age: 1,
                              sex: "male",
                              adoption_status: "available")

pet_2 = shelter_1.pets.create!(image: "https://usercontent1.hubstatic.com/2088428.jpg",
                              name: "Merle",
                              description: "Mostly a wolf",
                              approximate_age: 5,
                              sex: "male",
                              adoption_status: "available")

pet_3 = shelter_2.pets.create!(image: "https://1.bp.blogspot.com/-AgSjAIAAGQU/XXgHAahd80I/AAAAAAACMYQ/ja2TJ7tMZE8uTmzyXJ0ySHd2Ml3DrzmWQCLcBGAs/s1600/il_794xN.1383776661_dosv.jpg",
                              name: "HeiHei",
                              description: "1 year old pet rooster",
                              approximate_age: 1,
                              sex: "male",
                              adoption_status: "available")

pet_4 = shelter_2.pets.create!(image: "https://www.awesomestories.com/images/user/fc91b9a310fa92b98f27ab1038548062.jpg",
                              name: "Wilbur",
                              description: "Tiny baby pig",
                              approximate_age: 1,
                              sex: "male",
                              adoption_status: "available")

pet_5 = shelter_3.pets.create!(image: "https://i.pinimg.com/originals/52/4d/57/524d571a2e0d5bcb54f0b819ae9aeb63.jpg",
                              name: "Sandy",
                              description: "Spits and bites",
                              approximate_age: 4,
                              sex: "female",
                              adoption_status: "available")

pet_6 = shelter_3.pets.create!(image: "https://cinefex.com/backissues/covers/Cinefex_108.jpg",
                              name: "Charlotte",
                              description: "All the eyes and legs",
                              approximate_age: 6,
                              sex: "female",
                              adoption_status: "available")
