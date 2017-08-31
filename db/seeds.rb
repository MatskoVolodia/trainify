# delete all record
City.delete_all
Route.delete_all
Config.delete_all

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

# seed route
for i in 1..5
  date = DateTime.new(2017, 10, 10+i, 10, 0 ,0);
  for j in 0..City.count
    for k in 0..City.count
      if j != k
        Route.create(start_id: first_city_id + j, destination_id: first_city_id + k, departure_datetime: date.to_s, arrival_datetime: (date + 1).to_s, price_coefficient: rand + 1)
      end
    end
  end
end

# seed configs
Config.create(first_class_price: 100, second_class_price: 50, valid_since: '2017-01-01 00:00:00')