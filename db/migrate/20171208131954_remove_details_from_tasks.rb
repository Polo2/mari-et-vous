class RemoveDetailsFromTasks < ActiveRecord::Migration[5.0]
  def change
    remove_column :tasks, :details, :json
  end
end
