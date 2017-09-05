# delete all record
City.delete_all
Route.delete_all
Config.delete_all
Train.delete_all
Order.delete_all

# seed cities
City.create(title: 'Lviv')
City.create(title: 'Kyiv')
City.create(title: 'Ternopil')
City.create(title: 'Lutsk')
City.create(title: 'Kharkiv')
City.create(title: 'Odesa')
City.create(title: 'Uzhorod')
City.create(title: 'Dnipro')

first_city_id = City.first.id

# seed trains
Train.create(serial_number: "A001", first_class_seats_count: 500, second_class_seats_count: 1000)
Train.create(serial_number: "A002", first_class_seats_count: 100, second_class_seats_count: 100)
Train.create(serial_number: "A003", first_class_seats_count: 200, second_class_seats_count: 300)
Train.create(serial_number: "A004", first_class_seats_count: 500, second_class_seats_count: 1000)
Train.create(serial_number: "A005", first_class_seats_count: 100, second_class_seats_count: 1000)

first_train_id = Train.first.id

# seed route
(1..5).each do |day_step|
  date = DateTime.new(2017, 10, 10 + day_step, 10, 0 ,0);
  City.count.times do |i|
    City.count.times do |j|
      next if i == j

      Route.create(start_id:    first_city_id + i,
                   destination_id:      first_city_id + j,
                   departured_at:       date,
                   arrived_at:          date + 1,
                   price_coefficient:   (rand + 1).round(2),
                   train_id:            first_train_id + day_step - 1)
    end
  end
end

# seed configs
Config.create(first_class_price: 100, second_class_price: 50, valid_since: '2017-01-01 00:00:00')