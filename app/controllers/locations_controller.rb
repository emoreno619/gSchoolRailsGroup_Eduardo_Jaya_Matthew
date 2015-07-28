class LocationsController < ApplicationController
  require 'typhoeus'

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

  def search

    keyword = params[:keyword]
    location = params[:location]

    if !location || location == ""
      location = "San+Francisco"
    end

    if !keyword || keyword == ""
      keyword = "food"
    end

    happycow = "http://www.happycow.net/gmaps/searchmap.php?distance=15&distanceType=mi&list[]=vegan&kw=" + keyword + "&address=" + location + "&lat=&lon="
    res = Nokogiri::HTML(Typhoeus.get(happycow).response_body)
    puts res.css('side_bar')
    redirect_to locations_path
  end

  private

  def location_params
  	params.require(:location).permit(:name, :address, :phone, :gluten_free, :vegan, :image_url, :user_id)
  end

end
