class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :wedding_id
      t.json :details

      t.timestamps
    end
  end
end
