class DashboardService
  class Search < ApplicationService
    def initialize(params)
      @departure_id   = params[:departure_id]
      @arrival_id     = params[:arrival_id]
    end

    def call
      routes.map { |route| present(route) }
    end

    def routes
      @routes ||= Route.where(
        start_id:       departure_id,
        destination_id: arrival_id
      )
    end

    def departure_station
      @departure_station ||= City.find_by(id: departure_id)
    end

    def arrival_station
      @arrival_station ||= City.find_by(id: arrival_id)
    end

    private

    attr_reader :departure_id, :arrival_id

    def present(route)
      {
        route_id:           route.id,
        departure_station:  departure_station&.title,
        departured_at:      route.departured_at,
        arrival_station:    arrival_station&.title,
        arrived_at:         route.arrived_at
      }
    end
  end
end