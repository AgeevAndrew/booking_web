# frozen_string_literal: true

class CreateCompanySchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :company_schedules do |t|
      t.references :company, foreign_key: true
      t.string :week_day
      t.column :time_start, 'time with time zone'
      t.column :time_end, 'time with time zone'

      t.timestamps
    end
  end
end
