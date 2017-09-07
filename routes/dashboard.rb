class App < Sinatra::Base
  GET_CITIES_JSON_URL = '/cities.json'

  get '/' do
    @cities = City.all

    slim :index
  end

  post '/' do
    redirect DashboardService::QueryBuilder.new(request.params).call
  end

  get '/search/departure_id=:departure_id&arrival_id=:arrival_id?' do
    @routes = DashboardService::Search.new(params).call

    slim :index
  end

  get GET_CITIES_JSON_URL do
    @cities = City.all

    jbuilder :cities
  end
end
