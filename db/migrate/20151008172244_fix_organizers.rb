class FixOrganizers < ActiveRecord::Migration
  def change
    remove_column :organizers, :email
    remove_column :organizers, :password_digest
    remove_column :organizers, :is_verified
  end
end
