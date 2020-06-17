class AddUserRefToTopics < ActiveRecord::Migration[5.2]
  def up
    add_reference :topics, :user, foreign_key: true, null: false
  end

  def down
    add_reference :topics, :user, foreign_key: false, null: true
  end
end
