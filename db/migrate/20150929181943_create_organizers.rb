class CreateOrganizers < ActiveRecord::Migration
  def change
    create_table :organizers do |t|
      t.string "password_digest", null:false
      t.string "email", null:false
      t.string "name", null: false
      t.boolean "is_verified", default: false      
      t.timestamps null: false
    end
    add_index :organizers, :name
    add_index :organizers, :email
  end
end
