class ChangeDataTypeForImage < ActiveRecord::Migration[5.2]
  def change
    change_column :pets, :image, :string, default: "https://ichef.bbci.co.uk/news/410/cpsprodpb/71E1/production/_99735192_gettyimages-459467912.jpg"
  end
end
