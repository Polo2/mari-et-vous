class ChangeGuestTypeInRegistries < ActiveRecord::Migration[5.0]
  def change
    remove_column :registries, :guest
    add_column :registries, :guest, :text, array: true, default: []
  end
end
