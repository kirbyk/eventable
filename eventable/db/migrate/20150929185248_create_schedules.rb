class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.references :event, null: false
      t.string "description", null: false
      t.datetime "start_time", null: false
      t.datetime "end_time", null: false
      t.timestamps null: false
    end
  end
end
