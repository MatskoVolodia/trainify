class AddTrainToRoutes < ActiveRecord::Migration
  def change
    add_reference :routes, :train
  end
end
