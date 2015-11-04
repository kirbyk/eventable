class AddFieldsToPrize < ActiveRecord::Migration
  def change
    remove_column :prizes, :name
    add_column :prizes, :company, :string
    add_column :prizes, :description, :string
    add_column :prizes, :award, :string
  end
end
