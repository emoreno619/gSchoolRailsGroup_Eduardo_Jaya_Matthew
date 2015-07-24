class User < ActiveRecord::Base
	has_many :foods
	has_many :locations

end
