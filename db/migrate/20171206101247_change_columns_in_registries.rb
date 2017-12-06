class ChangeColumnsInRegistries < ActiveRecord::Migration[5.0]
  def change
    add_column :registries, :email, :string
    add_column :registries, :total, :integer
  end
end
