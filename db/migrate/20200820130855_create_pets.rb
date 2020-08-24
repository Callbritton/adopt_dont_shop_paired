class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.binary :image
      t.string :name
      t.integer :approximate_age
      t.string :sex
      t.string :name_of_shelter_where_the_pet_is_currently_located
    end
  end
end
