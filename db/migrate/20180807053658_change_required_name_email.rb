class ChangeRequiredNameEmail < ActiveRecord::Migration[5.1]
  def change
    change_column :accounts, :name, 'string', null: true
    change_column :accounts, :email, 'string', null: true
  end
end
