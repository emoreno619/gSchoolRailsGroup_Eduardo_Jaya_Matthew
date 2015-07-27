class LocationsController < ApplicationController
  def index
  	@locations = Location.all
  	if params[:user_id]
  		@u_locations = Location.where(user_id: params[:user_id])
  	end
  end

  def new
  end

  def show
  end

  def edit
  end
end
