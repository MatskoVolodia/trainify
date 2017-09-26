class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, length: 3..50
      t.string :password
    end
  end
end
