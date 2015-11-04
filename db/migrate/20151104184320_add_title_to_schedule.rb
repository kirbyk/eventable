class AddTitleToSchedule < ActiveRecord::Migration
  def change
    add_column :schedules, :title, :string
  end
end
