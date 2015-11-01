class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.string "description", null: false
      t.references :event
      t.timestamps null: false
    end
  end
end
