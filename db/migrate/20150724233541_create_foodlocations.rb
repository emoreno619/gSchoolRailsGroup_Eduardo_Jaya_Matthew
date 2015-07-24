class CreateFoodlocations < ActiveRecord::Migration
  def change
    create_table :foodlocations do |t|
      t.references :location, index: true, foreign_key: true
      t.references :food, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
