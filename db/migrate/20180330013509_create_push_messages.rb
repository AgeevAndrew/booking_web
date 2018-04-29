class CreatePushMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :push_messages do |t|
      t.references :company, foreign_key: true
      t.string :title
      t.text :body
      t.integer :success
      t.integer :failure

      t.timestamps
    end
  end
end
