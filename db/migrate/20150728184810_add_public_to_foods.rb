class AddPublicToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :is_public, :boolean
  end
end
