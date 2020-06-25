class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.string :image
      t.integer :user_id
      t.string :description

      t.timestamps
    end
  end
end
