class AddVehicleAndLocationUserId < ActiveRecord::Migration
  def change
    add_column :vehicles, :user_id, :integer
    add_column :locations, :user_id, :integer
  end
end
