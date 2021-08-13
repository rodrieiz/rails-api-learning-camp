class NameToTopics < ActiveRecord::Migration[6.1]
  def change
    change_column_null :topics, :name, false
    change_column_null :topics, :image, false
    add_index :topics, :name, unique: true
  end
end
