class RemoveGuestsFromRegistries < ActiveRecord::Migration[5.0]
  def change
    remove_column :registries, :guests
  end
end
