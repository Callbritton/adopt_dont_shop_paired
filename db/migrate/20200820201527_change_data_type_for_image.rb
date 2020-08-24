class ChangeDataTypeForImage < ActiveRecord::Migration[5.2]
  def change
    change_column :pets, :image, :string
  end
end
