class AddReferenceToOrder < ActiveRecord::Migration
  def change
    remove_column :orders, :user_email

    add_reference :orders, :user
  end
end
