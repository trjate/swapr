class AddNameToContraband < ActiveRecord::Migration
  def change
    add_column :contrabands, :name, :string
  end
end
