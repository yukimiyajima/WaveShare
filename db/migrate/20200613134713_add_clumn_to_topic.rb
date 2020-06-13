class AddClumnToTopic < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :lat, :float, null: false
    add_column :topics, :lng, :float, null: false
  end
end
