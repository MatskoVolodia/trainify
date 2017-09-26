class ChangeOrder < ActiveRecord::Migration
  def change
    remove_column :orders, :route
    add_reference :orders, :route
  end
end
