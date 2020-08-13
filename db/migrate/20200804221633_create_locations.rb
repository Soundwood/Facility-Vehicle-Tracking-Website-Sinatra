class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |s|
      s.string :station
      s.string :building
      s.string :total_vehicles
      s.time :avg_duration
    end
  end
end
