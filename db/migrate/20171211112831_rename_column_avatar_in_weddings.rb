class RenameColumnAvatarInWeddings < ActiveRecord::Migration[5.0]
  def change
    rename_column :weddings, :avatar, :spouse_photo
  end
end
