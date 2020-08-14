# Add seed data here. Seed your database with `rake db:seed`
@prng = Random.new(876)
Vehicle.delete_all
Location.delete_all
Modification.delete_all

20.times do
    station_array = ['Wash1','Wash2','PP1','PP2','Bay1','Bay2','Bay3','Bay4','Bay5','Bay6','Bay7','Bay8','Bay9','Bay10','Bay11','Bay12']
    location_array = ['Main','Acces','Final']
    Location.create(station: "#{station_array[rand(station_array.length)]}", building: "#{location_array.sample}")
end
400.times do
    Vehicle.create(vin: Faker::Vehicle.vin, model: Faker::Vehicle.model(make_of_model: 'Toyota'), sub_model: Faker::Vehicle.drive_type, location_id: rand(124..144))
end
20.times do
    Modification.create(name: Faker::Vehicle.car_options)
end