class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :password_digest
      t.string :created_stores
      t.string :created_foods

      t.timestamps null: false
    end
  end
end
