class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.boolean :gluten_free
      t.boolean :vegan
      t.string :image_url

      t.timestamps null: false
    end
  end
end
