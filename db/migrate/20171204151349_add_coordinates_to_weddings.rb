class AddCoordinatesToWeddings < ActiveRecord::Migration[5.0]
  def change
    add_column :weddings, :latitude, :float
    add_column :weddings, :longitude, :float
  end
end
