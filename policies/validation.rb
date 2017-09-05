module Validation
  def self.dashboard_params_invalid?(params)
    params[:departure_id].nil? ||
    params[:departure_id].empty? ||
    params[:arrival_id].nil? ||
    params[:arrival_id].empty?
  end
end