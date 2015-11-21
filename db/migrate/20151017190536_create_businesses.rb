class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :username
      t.string :password
      t.string :business
      
      t.timestamps null: false
    end
  end
end
