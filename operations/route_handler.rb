module RouteHandler
  def self.build_route_view_object(route, params)
    {
        route_id:           route.id,
        departure_station:  City.find(params[:departure_id]).title,
        departured_at:      route.departured_at,
        arrival_station:    City.find(params[:arrival_id]).title,
        arrived_at:         route.arrived_at
    }
  end

  def self.get_routes(params)
    Route.where({ start_id: params[:departure_id], destination_id: params[:arrival_id]})
  end
end