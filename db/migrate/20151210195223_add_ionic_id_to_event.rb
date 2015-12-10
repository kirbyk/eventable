class AddIonicIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :ionic_id, :string
  end
end
