class DashboardPolicy
  def initialize(params)
    @departure_id = params['departure_id']
    @arrival_id = params['arrival_id']
  end

  def params_valid?
    !(@departure_id.blank? || @arrival_id.blank?)
  end
end