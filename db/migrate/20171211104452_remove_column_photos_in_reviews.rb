class RemoveColumnPhotosInReviews < ActiveRecord::Migration[5.0]
  def change
    remove_column :reviews, :photos, :string
  end
end

