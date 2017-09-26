class City < ActiveRecord::Base
  validates_presence_of :title

  has_many :routes
end
