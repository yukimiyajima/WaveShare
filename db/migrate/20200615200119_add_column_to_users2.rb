class AddColumnToUsers2 < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :icon, :text
  end
end
