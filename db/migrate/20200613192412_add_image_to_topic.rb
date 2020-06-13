class AddImageToTopic < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :image, :text
  end
end
