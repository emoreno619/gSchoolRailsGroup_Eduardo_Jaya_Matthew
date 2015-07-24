class CreateFoodusers < ActiveRecord::Migration
  def change
    create_table :foodusers do |t|
      t.references :user, index: true, foreign_key: true
      t.references :food, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
