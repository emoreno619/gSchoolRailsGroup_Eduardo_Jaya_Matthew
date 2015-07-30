class AddLongitudeToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :longitude, :string
  end
end
