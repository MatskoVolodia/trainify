class ChangeUserEmailToReferenceInOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :user
    remove_column :orders, :user_email
  end
end
