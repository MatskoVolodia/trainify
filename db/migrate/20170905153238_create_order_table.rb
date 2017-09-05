class CreateOrderTable < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :user_email
      t.integer :route, null:false, :references => [:routes, :id]
      t.integer :first_class_seats_count
      t.integer :second_class_seats_count
    end
  end
end
