$(function(){
	var sanFrancisco = new google.maps.LatLng(37.7833,-122.4167);
	var location = sanFrancisco
	
	var map;
	function initialize() {
		map = new google.maps.Map(document.getElementById('map-canvas'), {
		      center: location,
		      zoom: 15
		    });
	}

	google.maps.event.addDomListener(window, 'load', initialize);
})