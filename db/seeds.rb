# Add seed data here. Seed your database with `rake db:seed`
@prng = Random.new(876)
Vehicle.delete_all
Location.delete_all
Modifaction.delete_all

50.times do
    Vehicle.create(vin: Faker::Vehicle.vin, model: Faker::Vehicle.model(make_of_model: 'Toyota'), sub_model: Faker::Vehicle.drive_type)
end
20.times do
    Location.create(station: 'M#{@prng(1..12)}', building: 'Main')
end
20.times do
    Modification.create(name: Faker::Vehicle.car_options)
end