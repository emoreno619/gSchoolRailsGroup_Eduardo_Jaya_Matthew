class LocationsController < ApplicationController
  #require 'typhoeus'
  #require 'selenium-webdriver'

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

    ######### HAPPY COW SEARCH

    happycow = "http://www.happycow.net/disp_results_address.php?distance=15&lat=37.7749&lon=-122.419&list[]=vegan&sortby=0&kw=" + keyword
    res = Nokogiri::HTML(Typhoeus.get(happycow).response_body)

    happyResult = Hash.new
    # puts "LOOOOOOOOOK HERE " 
    res.css(".search-results-item").each do |location|
      puts location.css('a').first.text
      if location.css('a').first.text != ""
        temp = location.css('span')[2].children.first.text.strip
        temp1 = temp.slice(0, temp.index(',')).strip

        temp2 = temp.slice(temp.index(',')+1, temp.index(")")).strip.inspect
        
        temp = temp1 + temp2
        
        happyResult[location.css('a').first.text] = temp
      end
    end

    # puts happyResult


    ######## KINNIKINNICK SEARCH

    kinn = "http://consumer.kinnikinnick.com/index.cfm/fuseaction/consumer.storefinder/searchterm/"+ location +"/fromSpotter/0" 
    res = Nokogiri::HTML(Typhoeus.get(kinn).response_body)

    kinnResult = []

    puts res.css(".finderWrapper").children[8].children.length
    res.css(".finderWrapper").children[8].children.each do |location|
        if location.name != "br"
          location = location.text.strip
          if location.index("|")
            location1 = location.slice(0, location.index("|"))
            location2 = location.slice(location.index("|"), location.length)
            location2 = location2.slice(2, location2.length)
            location2.gsub!("|", "")
            location = location1 + "\n" + location2
          end
          kinnResult << location
        end
    end

    # puts kinnResult

    ######## SELENIUM SEARCHES

    drive_em(location)




    redirect_to locations_path
  end

  private

  def drive_em(location)
    driver = Selenium::WebDriver.for :firefox
    driver.get "http://udisglutenfree.com/store-locator/"

    element = driver.find_element :id => "addressInput"
    element.send_keys location
    element.submit

    
    sleep 1

    # testing.....

    # wait.until { driver.title.downcase.start_with? "cheese!" }

    # puts "LOOOOOOOOOK HERE " 
    element = driver.find_element :id => "map_sidebar"
    puts element.text

    driver.quit
    
  end

  def location_params
  	params.require(:location).permit(:name, :address, :phone, :gluten_free, :vegan, :image_url, :user_id)
  end

end
