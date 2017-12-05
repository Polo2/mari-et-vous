class ChangePresenceTypeInRegistries < ActiveRecord::Migration[5.0]
  def change
    change_column :registries, :presence, :string
  end
end
