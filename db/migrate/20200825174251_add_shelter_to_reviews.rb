class AddShelterToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :shelter, :reference
  end
end
