class LocationsController < ApplicationController
  def index
  	@locations = Location.all
  	if params[:user_id]
  		@u_locations = Location.where(user_id: params[:user_id])
  	end
  end

  def new
  	@location = Location.new

  end

  def create
  	@location = Location.create(location_params)
  	if @location.save
  		redirect_to locations_path, flash: { success: "Location Added!" }
  	else
  		render new_location_path
  	end
  end

  def show
  	# if user id in params render page for location with edit
  	#otherwise render page for location
  		@location = Location.where(id: params[:id])[0]
  end

  def edit
  	@location = Location.where(id: params[:id])[0]
  end

  def update
  	@location = Location.find_by_id params[:id]
  	@location.update location_params
  	if @location.save
  		redirect_to locations_path, flash: {success: "#{@location.name} updated!"}
  	else
  		render :edit
  	end

  end

  def destroy
  	@location = Location.find_by_id params[:id]
  	@location.destroy
  	redirect_to locations_path, flash: {success: "#{@location.name} D E S T R O Y E D!"}
  end

  private

  def location_params
  	params.require(:location).permit(:name, :address, :phone, :gluten_free, :vegan, :image_url, :user_id)
  end

end
