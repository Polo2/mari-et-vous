class AddColumnsToWeddings < ActiveRecord::Migration[5.0]
  def change
    add_column :weddings, :token, :string
    add_column :weddings, :avatar, :string
  end
end
