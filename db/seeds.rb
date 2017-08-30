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
Route.create(start_id: first_city_id + 1, destination_id: first_city_id + 2, departure_datetime: "2017-10-10 10:00:00", arrival_datetime: "2017-10-10 15:00:00", price_coefficient: 1.5)
Route.create(start_id: first_city_id + 2, destination_id: first_city_id + 1, departure_datetime: "2017-10-10 10:00:00", arrival_datetime: "2017-10-10 15:00:00", price_coefficient: 2)
Route.create(start_id: first_city_id + 1, destination_id: first_city_id + 3, departure_datetime: "2017-10-12 10:00:00", arrival_datetime: "2017-10-12 15:00:00", price_coefficient: 1.5)
Route.create(start_id: first_city_id + 1, destination_id: first_city_id + 4, departure_datetime: "2017-10-12 10:00:00", arrival_datetime: "2017-10-12 15:00:00", price_coefficient: 3)
Route.create(start_id: first_city_id + 4, destination_id: first_city_id + 2, departure_datetime: "2017-10-15 10:00:00", arrival_datetime: "2017-10-15 15:00:00", price_coefficient: 1.1)
Route.create(start_id: first_city_id + 3, destination_id: first_city_id + 2, departure_datetime: "2017-10-15 10:00:00", arrival_datetime: "2017-10-15 15:00:00", price_coefficient: 1.3)
Route.create(start_id: first_city_id + 4, destination_id: first_city_id + 5, departure_datetime: "2017-10-17 10:00:00", arrival_datetime: "2017-10-17 15:00:00", price_coefficient: 2.5)
Route.create(start_id: first_city_id + 5, destination_id: first_city_id + 7, departure_datetime: "2017-10-17 10:00:00", arrival_datetime: "2017-10-17 15:00:00", price_coefficient: 2)
Route.create(start_id: first_city_id + 7, destination_id: first_city_id + 3, departure_datetime: "2017-10-20 10:00:00", arrival_datetime: "2017-10-20 15:00:00", price_coefficient: 1)
Route.create(start_id: first_city_id + 7, destination_id: first_city_id + 2, departure_datetime: "2017-10-20 10:00:00", arrival_datetime: "2017-10-20 15:00:00", price_coefficient: 1.2)

#seed configs
Config.create(first_class_price: 100, second_class_price: 50, valid_since: '2017-01-01 00:00:00')