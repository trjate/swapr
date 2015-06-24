class CreateCurations < ActiveRecord::Migration
  def change
    create_table :curations do |t|
      t.string :name
      t.integer :user_id
      t.integer :parent_id

      t.timestamps null: false
    end
    add_index :curations, :user_id
    add_index :curations, :parent_id
  end
end
