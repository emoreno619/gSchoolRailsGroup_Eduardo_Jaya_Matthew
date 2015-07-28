class AddPublicToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :is_public, :boolean
  end
end
