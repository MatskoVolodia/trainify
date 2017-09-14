class RenameDbColumns < ActiveRecord::Migration
  def change
    rename_column :routes, :arrival_datetime, :arrived_at
    rename_column :routes, :departure_datetime, :departured_at
  end
end
