def random_seats_count
  [100, 200, 300, 500, 1000].sample
end

# delete all record
City.delete_all
Route.delete_all
Config.delete_all
Train.delete_all
Order.delete_all

# seed cities
8.times { City.create(title: Faker::GameOfThrones.city) }

first_city_id = City.first.id

# seed trains
5.times do |i|
  Train.create(
    serial_number:            Faker::Vehicle.vin, 
    first_class_seats_count:  random_seats_count,
    second_class_seats_count: random_seats_count
  )
end

first_train_id = Train.first.id

# seed route
(1..5).each do |day_step|
  date = DateTime.new(2017, 10, 10 + day_step, 10, 0, 0)
  City.count.times do |i|
    City.count.times do |j|
      next if i == j

      Route.create(
        start_id:            first_city_id + i,
        destination_id:      first_city_id + j,
        departured_at:       date,
        arrived_at:          date + 1,
        price_coefficient:   (rand + 1).round(2),
        train_id:            first_train_id + day_step - 1
      )
    end
  end
end

# seed configs
Config.create(
  first_class_price:  100,
  second_class_price: 50,
  valid_since:        '2017-01-01 00:00:00'
)

# seed users
User.create(email: 'admin@gmail.com', password: 'admin123')
