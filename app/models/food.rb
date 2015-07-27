class Food < ActiveRecord::Base

	belongs_to :user

	validates :name, presence: true
	validates :gluten_free, :inclusion => {:in => [true, false]}
	validates :vegan, :inclusion => {:in => [true, false]}

end
