class Food < ActiveRecord::Base

	belongs_to :user

	has_many :foodlocations, dependent: :destroy
	has_many :locations, through: :foodlocations

	validates :name, presence: true
	validates :gluten_free, :inclusion => {:in => [true, false]}
	validates :vegan, :inclusion => {:in => [true, false]}

end
