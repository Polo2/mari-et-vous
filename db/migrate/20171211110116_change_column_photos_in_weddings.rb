class ChangeColumnPhotosInWeddings < ActiveRecord::Migration[5.0]
  def change
    remove_column :weddings, :photos, :string
    add_column :weddings, :album_photos, :string
  end
end
