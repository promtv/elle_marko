class CreateClothings < ActiveRecord::Migration[8.0]
  def change
    create_table :clothings do |t|
      t.string :classification, null:false
      t.string :brand, null:false
      t.string :name, null:false
      t.integer :price, null:false
      t.string :material, null:false
      t.string :size, null:false
      t.text :description
      t.string :for_whom, null:false
      t.string :image_url

      t.timestamps
    end

    add_check_constraint :clothings, "classification IN ('headwear','shoes','t-shirts','jackets','sweaters',
    'business_suits')"
    add_check_constraint :clothings, "for_whom IN ('for_men','for_women','unisex')"

  end
end
