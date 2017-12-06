class AddSpouseFirstNameAndSpouseLastNameInWeddings < ActiveRecord::Migration[5.0]
  def change
    add_column :weddings, :spouse_first_name, :string
    add_column :weddings, :spouse_last_name, :string
  end
end
