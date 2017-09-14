class RenameColumnInOrders < ActiveRecord::Migration
  def changes
    rename_column :orders, :route, :route_id
  end
end
