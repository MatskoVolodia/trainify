class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.integer :start_id, null: false, :references => [:cities, :id]
      t.integer :destination_id, null:false, :references => [:cities, :id]
    end
  end
end
