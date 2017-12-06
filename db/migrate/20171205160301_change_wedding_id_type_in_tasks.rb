class ChangeWeddingIdTypeInTasks < ActiveRecord::Migration[5.0]
  def change
    remove_column :tasks, :wedding_id
    add_reference :tasks, :wedding, foreign_key: true
  end
end
