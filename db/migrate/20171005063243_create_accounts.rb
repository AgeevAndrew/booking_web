class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.string :email
      t.column :addresses, 'jsonb[]', null: false, default: '{}'

      t.timestamps
    end
  end
end
