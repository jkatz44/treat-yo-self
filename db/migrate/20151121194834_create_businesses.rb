class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :business
      t.string :email
      t.string :password_digest
      
      t.timestamps null: false
    end
  end
end