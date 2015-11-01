class CreatePrizes < ActiveRecord::Migration
  def change
    create_table :prizes do |t|
      t.string :name, null: false
      t.references :event
      t.timestamps null: false
    end
  end
end
