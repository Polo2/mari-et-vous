class ChangeGuestsColumnInRegistries < ActiveRecord::Migration[5.0]
  def change
    remove_column :registries, :guests
    add_column :registries, :guests, :text
  end
end
