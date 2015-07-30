class AdminController < ApplicationController
	def approve
		@locations = Location.where(is_public: false)
		@foods = Food.where(is_public: false)

	end
end
