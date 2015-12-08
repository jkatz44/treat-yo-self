class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :phone_number     
      t.string :business_name
      t.integer :points
      t.string :bizlogo

      t.timestamps null: false
    end
  end
end
