class CreateReviews < ActiveRecord::Migration[8.0]
  def change
    create_table :reviews do |t|
      t.string :user_name
      t.text :content
      t.references :clothing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
