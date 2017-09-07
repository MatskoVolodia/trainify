class App < Sinatra::Base
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

  get '/cities.json' do
    @cities = City.all

    jbuilder :cities
  end
end
