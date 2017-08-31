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
(1..5).each do |daystep|
  date = DateTime.new(2017, 10, 10+daystep, 10, 0 ,0);
  (0..City.count).each do |i|
    (0..City.count).each do |j|
      if i != j
        Route.create(start_id: first_city_id + i,
                     destination_id: first_city_id + j,
                     departure_datetime: date.to_s,
                     arrival_datetime: (date + 1).to_s,
                     price_coefficient: rand + 1)
      end
    end
  end
end

# seed configs
Config.create(first_class_price: 100, second_class_price: 50, valid_since: '2017-01-01 00:00:00')