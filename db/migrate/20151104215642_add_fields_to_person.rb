class AddFieldsToPerson < ActiveRecord::Migration
  def change
    remove_column :people, :first_name
    remove_column :people, :last_name
    remove_column :people, :bio
    add_column :people, :name, :string
    add_column :people, :company, :string
    add_column :people, :skills, :string
  end
end
