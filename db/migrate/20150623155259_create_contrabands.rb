class CreateContrabands < ActiveRecord::Migration
  def change
    create_table :contrabands do |t|
      t.integer :user_id
      t.attachment :contraband

      t.timestamps null: false
    end
  end
end
