class AddBgColor < ActiveRecord::Migration
  def change
    add_column :events, :app_fgcolor, :string
    add_column :events, :app_bgcolor, :string
    remove_column :events, :app_color, :string
  end
end
