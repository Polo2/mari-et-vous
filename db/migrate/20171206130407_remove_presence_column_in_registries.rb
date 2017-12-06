class RemovePresenceColumnInRegistries < ActiveRecord::Migration[5.0]
  def change
    remove_column :registries, :presence, :string
  end
end
