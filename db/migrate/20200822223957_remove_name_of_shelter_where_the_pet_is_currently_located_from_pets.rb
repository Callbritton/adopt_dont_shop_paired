class RemoveNameOfShelterWhereThePetIsCurrentlyLocatedFromPets < ActiveRecord::Migration[5.2]
  def change
    remove_column :pets, :name_of_shelter_where_the_pet_is_currently_located, :string
  end
end
