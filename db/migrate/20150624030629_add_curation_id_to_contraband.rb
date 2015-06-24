class AddCurationIdToContraband < ActiveRecord::Migration
  def change
    add_column :contrabands, :curation_id, :integer
  end
end
