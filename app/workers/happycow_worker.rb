class HappycowWorker
	include Sidekiq::Worker

	def perform(site_id)
		
		require 'open-uri'
		
		if !location
			location = "San+Francisco"
		end

		if !keyword
			keyword = ""
		end

		happycow = "http://www.happycow.net/gmaps/searchmap.php?distance=15&distanceType=mi&list[]=vegan&kw=" + keyword + "&address=" + location + "&lat=&lon="
	end
end