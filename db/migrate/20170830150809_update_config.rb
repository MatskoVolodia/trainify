class UpdateConfig < ActiveRecord::Migration
  def change
    add_column :configs, :valid_since, :datetime
  end
end
