class Location < ActiveRecord::Base

	belongs_to :user

	validates :name, presence: true
	validates :address, presence: true, uniqueness: true
	validates :phone, uniqueness: true
	validates :gluten_free, :inclusion => {:in => [true, false]}
	validates :vegan, :inclusion => {:in => [true, false]}
end
