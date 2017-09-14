class DashboardPolicy
  def initialize(params)
    @departure_id = params['departure_id']
    @arrival_id   = params['arrival_id']
  end

  def params_valid?
    departure_id.present? && arrival_id.present?
  end

  private

  attr_reader :departure_id, :arrival_id
end
