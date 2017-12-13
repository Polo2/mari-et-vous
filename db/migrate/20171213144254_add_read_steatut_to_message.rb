class AddReadSteatutToMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :read, :boolean
  end
end
