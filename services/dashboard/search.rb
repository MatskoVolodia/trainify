class DashboardService
  class Search < ApplicationService
    def initialize(params)
      @departure_id   = params[:departure_id]
      @arrival_id     = params[:arrival_id]
    end

    def call
      found_routes = Route.where(
        start_id:       @departure_id,
        destination_id: @arrival_id
      )

      routes = found_routes.map { |route| present(route) }
    end

    private

    def present(route)
      {
        route_id:           route.id,
        departure_station:  City.find_by_id(@departure_id)&.title,
        departured_at:      route.departured_at,
        arrival_station:    City.find_by_id(@arrival_id)&.title,
        arrived_at:         route.arrived_at
      }
    end
  end
end