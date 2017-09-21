class BookingService
  class CreateOrder < ApplicationService
    delegate :params_valid?, to: :policy

    def initialize(args)
      @params       = args[:params]
      @env          = args[:env]
      @current_user = args[:current_user]
    end

    def call
      create_order if params_valid?
    end

    private

    attr_reader :params, :env, :current_user

    def policy
      @policy ||= BookingPolicy.new(params)
    end

    def create_order
      Order.create(
        user_id:                  current_user.id,
        route:                    params[:route_id],
        first_class_seats_count:  params[:first_class].to_i,
        second_class_seats_count: params[:second_class].to_i
      )
    end
  end
end
