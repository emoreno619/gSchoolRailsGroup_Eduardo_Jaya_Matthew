class Foodlocation < ActiveRecord::Base
  belongs_to :location
  belongs_to :food
end
