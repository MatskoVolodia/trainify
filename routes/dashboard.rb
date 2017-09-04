class App < Sinatra::Base
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
    @routes = Route.where({ start_id: params[:departure_id], destination_id: params[:arrival_id]}).map do |route|
      {
          route_id:           route.id,
          departure_station:  City.find(params[:departure_id]).title,
          departured_at:      route.departured_at,
          arrival_station:    City.find(params[:arrival_id]).title,
          arrived_at:         route.arrived_at
      }
    end

    slim :index
  end

  get '/cities.json' do
    @cities = City.all

    jbuilder :cities
  end
end