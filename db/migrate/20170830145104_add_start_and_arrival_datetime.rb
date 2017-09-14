class AddStartAndArrivalDatetime < ActiveRecord::Migration
  def change
    add_column :routes, :departure_datetime, :datetime
    add_column :routes, :arrival_datetime, :datetime
  end
end
