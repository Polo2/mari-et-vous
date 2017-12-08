class CreateGuests < ActiveRecord::Migration[5.0]
  def change
    create_table :guests do |t|
      t.references :registry, null: false
      t.string :name, null: false
      t.boolean :presence, default: false

      t.timestamps
    end
  end
end
