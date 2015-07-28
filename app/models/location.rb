class Location < ActiveRecord::Base

	belongs_to :user

	has_many :locationusers
	has_many :users, through: :locationusers

	has_many :foodlocations, dependent: :destroy
	has_many :foods, through: :foodlocations

	validates :name, presence: true
	validates :address, presence: true, uniqueness: true
	validates :phone, uniqueness: true
	validates :gluten_free, :inclusion => {:in => [true, false]}
	validates :vegan, :inclusion => {:in => [true, false]}
end
