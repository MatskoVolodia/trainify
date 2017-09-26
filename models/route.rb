class Route < ActiveRecord::Base
  has_many :orders

  belongs_to :start,       foreign_key: 'start_id',       class_name: 'City'
  belongs_to :destination, foreign_key: 'destination_id', class_name: 'City'
end
