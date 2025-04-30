class RemoveImageUrlFromClothings < ActiveRecord::Migration[8.0]
  def change
    remove_column :clothings, :image_url, :string
  end
end
