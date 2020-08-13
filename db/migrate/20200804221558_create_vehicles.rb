class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |v|
      v.string :vin
      v.string :model
      v.string :sub_model
      v.timestamp :arrival_time
      v.timestamp :departure_time
      v.time :current_location_duration
      v.time :total_duration
    end
  end
end
