class App < Sinatra::Base
  get '/booking/:route_id' do
    @route = Route.find(params[:route_id])
    @department = City.find(@route.start_id)
    @arrival = City.find(@route.destination_id)
    @train = Train.find(@route.train_id)
    slim :booking
  end
end