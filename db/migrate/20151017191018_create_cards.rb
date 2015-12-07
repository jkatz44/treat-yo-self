class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :customer_name
      t.string :phone_number     
      t.string :business_name
      t.integer :points

      t.timestamps null: false
    end
  end
end
