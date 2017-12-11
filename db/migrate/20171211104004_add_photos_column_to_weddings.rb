class AddPhotosColumnToWeddings < ActiveRecord::Migration[5.0]
  def change
    add_column :weddings, :photos, :string
  end
end
