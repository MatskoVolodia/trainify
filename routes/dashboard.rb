class App < Sinatra::Base 
  get '/' do
    @cities = City.all
    
    @routes = Route.all.map do |route|
      {
        from: @cities.find { |c| c.id == route.start_id }.title,
        departure_datetime: route.departure_datetime,
        to: @cities.find { |c| c.id == route.destination_id }.title,
        arrival_datetime: route.arrival_datetime,
      }
    end
    slim :index
  end
end