class DashboardService
  class QueryBuilder < ApplicationService
    delegate :params_valid?, to: :policy

    def initialize(params)
      @params = params
    end

    def call
      params_valid? ? "/search/#{build_query}" : '/'
    end

    def policy
      @policy ||= DashboardPolicy.new(params)
    end

    private

    attr_reader :params

    def build_query
      @params.map { |key, value| "#{key}=#{value}" } .join('&')
    end
  end
end
