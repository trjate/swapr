class AddAssortedIndexes < ActiveRecord::Migration
  def change
    add_index :users, :email, unique: true
    add_index :users, :access_token
    add_index :contrabands, :user_id
  end
end
