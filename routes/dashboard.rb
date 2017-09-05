class App < Sinatra::Base
  GET_CITIES_JSON_URL = '/cities.json'

  get '/' do
    @cities = City.all

    slim :index
  end

  post '/' do
    if Validation::dashboard_params_invalid?(params)
      redirect '/'
    else
      query = Query::build_query(request.params)
      redirect "/search/#{query}"
    end
  end

  get '/search/departure_id=:departure_id&arrival_id=:arrival_id?' do
    @routes = RouteHandler::get_routes(params).map do |route|
      RouteHandler::build_route_view_object(route, params)
    end

    slim :index
  end

  get GET_CITIES_JSON_URL do
    @cities = City.all

    jbuilder :cities
  end
end