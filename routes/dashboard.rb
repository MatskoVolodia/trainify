class App < Sinatra::Base 
  get '/' do
    @cities = City.all

    slim :index
  end

  post '/' do
    query = request.params.map{|key, value| "#{key}=#{value}"}.join('&')
    redirect "/search/#{query}"
  end

  get '/search/departure_id=:departure_id&arrival_id=:arrival_id?' do
    @routes = Route.where({ start_id: params[:departure_id], destination_id: params[:arrival_id]}).map do |route|
      {
          departure_station: City.find_by_id(params[:departure_id]).title,
          departure_datetime: route.departure_datetime,
          arrival_station: City.find_by_id(params[:arrival_id]).title,
          arrival_datetime: route.arrival_datetime
      }
    end
    slim :index
  end

  get '/cities.json' do
    content_type :json
    @cities = City.all
    @cities.map { |c| { label: c.title, value: c.id } }.to_json
  end
end