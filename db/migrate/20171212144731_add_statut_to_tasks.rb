class AddStatutToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :statut, :boolean
  end
end
