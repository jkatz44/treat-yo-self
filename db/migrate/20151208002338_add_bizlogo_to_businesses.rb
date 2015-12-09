class AddBizlogoToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :bizlogo, :string
  end
end
