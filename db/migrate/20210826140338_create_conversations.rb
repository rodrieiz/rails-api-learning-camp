class CreateConversations < ActiveRecord::Migration[6.1]
  def change
    create_table :conversations do |t|
      t.integer :user1, null: false, foreign_key: true
      t.integer :user2, null: false, foreign_key: true

      t.timestamps
    end
  end
end
