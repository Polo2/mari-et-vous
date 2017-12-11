class RemoveCategorie < ActiveRecord::Migration[5.0]
  def change
    remove_reference :elements, :category
    add_reference :elements, :task
    drop_table :categories
  end
end
