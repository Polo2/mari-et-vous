class CreateWeddings < ActiveRecord::Migration[5.0]
  def change
    create_table :weddings do |t|
      t.string :title
      t.text :description
      t.date :date
      t.string :location
      t.string :photo
      t.integer :capacity
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
