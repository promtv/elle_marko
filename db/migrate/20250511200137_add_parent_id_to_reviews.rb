class AddParentIdToReviews < ActiveRecord::Migration[8.0]
  def change
    add_column :reviews, :parent_id, :integer
  end
end
