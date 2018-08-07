class CreateTidings < ActiveRecord::Migration[5.1]
  def change
    create_table :tidings do |t|
      t.references :company
      t.integer :category
      t.string :title
      t.text :body
      t.text :message
      t.integer :active

      t.timestamps
    end
  end
end
