class DashboardService
  class QueryBuilder < ApplicationService
    delegate :params_valid?, to: :policy

    def initialize(params)
      @params = params
    end

    def call
      if params_valid? then "/search/#{build_query}" else '/' end
    end

    def policy
      @policy ||= DashboardPolicy.new(@params)
    end

    private

    def build_query
      @params.map { |key, value| "#{key}=#{value}" } .join('&')
    end
  end
end
