class AddColumnToComment < ActiveRecord::Migration[5.2]
  def up
    add_reference :comments, :user, foreign_key: true, null: false
  end

  def down
    add_reference :comments, :user, foreign_key: false, null: true
  end
end

