class CreateTrains < ActiveRecord::Migration
  def change
    create_table :trains do |t|
      t.string :serial_number
      t.integer :first_class_seats_count
      t.integer :second_class_seats_count
    end

    add_column :routes, :price_coefficient, :integer
  end
end
