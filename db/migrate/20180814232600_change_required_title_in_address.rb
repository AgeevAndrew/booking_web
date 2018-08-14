class ChangeRequiredTitleInAddress < ActiveRecord::Migration[5.1]
  def up
    change_column(:addresses, :title, :string, null: true)
  end
  def down
    change_column(:addresses, :title, :string, null: false)
  end
end
