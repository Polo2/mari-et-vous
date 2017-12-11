class CreateElements < ActiveRecord::Migration[5.0]
  def change
    create_table :elements do |t|
      t.references :category, foreign_key: true
      t.text :content
      t.boolean :public
    end
  end
end
