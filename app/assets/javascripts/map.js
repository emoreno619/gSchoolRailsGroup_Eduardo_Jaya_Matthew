$(function(){

	var sanFrancisco = new google.maps.LatLng(37.7833,-122.4167);
	var location = sanFrancisco
	
	var map;

	function initialize() {
		map = new google.maps.Map(document.getElementById('map-canvas'), {
		      center: location,
		      zoom: 15
		    });
	
		if(formData.city){
		      	console.log("GOT THERE")
		      	address = formData.city
		      	geocoder = new google.maps.Geocoder();
		      	geocoder.geocode( { 'address': address}, function(results, status) {
		      	      if (status == google.maps.GeocoderStatus.OK) {
		      	        
		      	        location = results[0].geometry.location
		      	        console.log(location)
		      	        map.setCenter(results[0].geometry.location);

		      	        var request = {
		      	          location: location,
		      	          radius: '500',
		      	          query: formData.name
		      	        };

		      	        service = new google.maps.places.PlacesService(map);
		      	        service.textSearch(request, callback);
		      	        // var marker = new google.maps.Marker({
		      	        //     map: map,
		      	        //     position: results[0].geometry.location
		      	        // });
		      	      } else {
		      	        // alert("Geocode was not successful for the following reason: " + status);
		      	      }
		      	    });
		      } // END IF

	createMarker(sanFrancisco)

	} // END FUNCTION



	var formData = {}

	google.maps.event.addDomListener(window, 'load', initialize);

	function distanceBtwnPoints(me,loc) {
	  // google.maps.geometry.spherical.computeDistanceBetween (latLngA, latLngB);
	   var fromMeToLoc = google.maps.geometry.spherical.computeDistanceBetween (me, loc);
	   console.log(fromMeToLoc, "DISTANCE BTWN");
	}
	

	function createMarker(place) {
	  var marker = new google.maps.Marker({
	    map: map,
	    position: sanFrancisco
	  });

	  google.maps.event.addListener(marker, 'click', function() {
	    var options = {
	    	map: map,
	    	position: sanFrancisco, //place.geometry.location,
	    	content: "IFFF YOUUURE GOINNG TOO SANNN FFRRSNNSXCOIIOOOOO"
	    }

	    // var infowindow = new google.maps.InfoWindow(options);

	    // infowindow.setContent(place.name);
	    // infowindow.open(map, this);
	  });
	}

	$('#bestSearchForm').submit(function(e){
		e.preventDefault();
		// ids = []
		// $('.aPlace').remove()
		formData.name = $('#bestKeyword').val();
		console.log(formData.name)
		//need to create google.maps.LatLng object from city search to be stored
		//request.location below and map.center
		formData.city = $('#bestLocation').val();
		
		initialize();
		
	})
  var markerAlready = false
	function getLocation() {
	  if ("geolocation" in navigator) {
	      changeButtonText();
	   navigator.geolocation.getCurrentPosition(function (position) {
	     console.log(position.coords.latitude, position.coords.longitude);
	     myLatLong = new google.maps.LatLng(position.coords.latitude, position.coords.longitude)
	     distanceBtwnPoints(myLatLong, sanFrancisco)
	    if (markerAlready === false) {
	     addMarkerUserLoc(myLatLong) 
	     markerAlready = true
	     $("#myLocation").children().css("color","black")
	      $("#myLocation").children().text("Found You!");   
	      // $("#myLocation").removeClass('fade')
	    }
	   });
	  } else {
	    // no native support; maybe try a fallback?
	    $("#myLocation").children().text("Find Failed :("); 
	    // $("#myLocation").removeClass('fade')
	  }
	  
	}

	$("#myLocation").click(function(){

		if ($("#myLocation").children().text() !== "Found You!") {
	  		getLocation()  
	    }
	}) // END FUNCTION

	function addMarkerUserLoc(location) {
	  var image = "assets/marker-youAreHere.png"

	  var marker = new google.maps.Marker({
	    position: location,
	    map: map,
	    icon: image,
	    animation: google.maps.Animation.DROP
	  });
	}

	function changeButtonText(){
	  window.setTimeout(function() {
	    $("#myLocation").children().text("Finding You.......");
	    $("#myLocation").children().css("color","blue")
	    }, 100)
	  // $("#myLocation").children().addClass('fade')



	}

	initialize();
})