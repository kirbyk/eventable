class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string "name", null:false
      t.string "type", null:false
      t.string "app_color"
      t.string "app_logo"
      t.references "organizer"
      t.timestamps null: false
    end
    add_index :events, :name
    add_index :events, :type
  end
end
