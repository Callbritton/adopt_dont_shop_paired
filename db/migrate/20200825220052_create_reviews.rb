class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :rating
      t.string :content
      t.string :optional_picture
    end
  end
end
