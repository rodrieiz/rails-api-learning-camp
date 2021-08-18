class CreateTargets < ActiveRecord::Migration[6.1]
  def change
    create_table :targets do |t|
      t.belongs_to :user, null: false, index: true, foreign_key: true
      t.belongs_to :topic, null: false, index: true, foreign_key: true
      t.string :title
      t.decimal :radius
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
