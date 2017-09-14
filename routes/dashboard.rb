class App < Sinatra::Base
  GET_CITIES_JSON_URL = '/cities.json'.freeze

  get '/' do
    @cities = City.all

    slim :index
  end

  post '/' do
    redirect DashboardService::QueryBuilder.call(request.params)
  end

  get '/search/departure_id=:departure_id&arrival_id=:arrival_id?' do
    @routes = DashboardService::Search.call(params)

    slim :index
  end

  get GET_CITIES_JSON_URL do
    @cities = City.all

    jbuilder :cities
  end
end
