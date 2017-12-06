class ChangeReferencesColumnInMessages < ActiveRecord::Migration[5.0]
  def change
    remove_column :messages, :user_id
    add_reference :messages, :user, foreign_key: true
    remove_column :messages, :task_id
    add_reference :messages, :task, foreign_key: true
  end
end
