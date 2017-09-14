class CreateConfig < ActiveRecord::Migration
  def change
    create_table :configs do |t|
      t.float :first_class_price
      t.float :second_class_price
    end

    change_column :routes, :price_coefficient, :float
  end
end
