class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.boolean :gluten_free
      t.boolean :vegan
      t.string :image_url

      t.timestamps null: false
    end
  end
end
