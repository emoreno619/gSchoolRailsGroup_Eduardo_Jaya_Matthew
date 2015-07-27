class User < ActiveRecord::Base
	has_many :foods
	has_many :locations

	has_many :locationusers, dependent: :destroy
end
