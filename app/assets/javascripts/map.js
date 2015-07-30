
$(function(){

	$('#gluten-event').bootstrapToggle('off')
	$('#vegan-event').bootstrapToggle('off')

	var sanFrancisco = new google.maps.LatLng(37.7833,-122.4167);
	// console.log(sanFrancisco,"*********SANFRANCISCO**********");

	var location = sanFrancisco
	
	var map;

	var checkboxes = document.getElementsByTagName('input');

	function initialize() {
		map = new google.maps.Map(document.getElementById('map-canvas'), {
		      center: location,
		      zoom: 15
		    });
	
		if(formData.city){
		      	// console.log("GOT THERE")
		      	address = formData.city
		      	geocoder = new google.maps.Geocoder();
		      	geocoder.geocode( { 'address': address}, function(results, status) {
		      	      if (status == google.maps.GeocoderStatus.OK) {
		      	        
		      	        location = results[0].geometry.location
		      	        // console.log(location)
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

	
	centerOnUserLocation()

	} // END FUNCTION



	var formData = {}

	google.maps.event.addDomListener(window, 'load', initialize);

	function distanceBtwnPoints(me,loc) {
	  // google.maps.geometry.spherical.computeDistanceBetween (latLngA, latLngB);
	   var fromMeToLoc = google.maps.geometry.spherical.computeDistanceBetween (me, loc);
	   // console.log(fromMeToLoc, "DISTANCE BTWN");
	   return fromMeToLoc
	}
	

	function createMarker(place, is_vegan) {
	  if (is_vegan)
	  	console.log("vegan!");
	  var image;
	  if (is_vegan)
	  	image = "assets/marker-v-web.png"
	  else
	    image = "assets/marker-gf-web.png"

	  var marker = new google.maps.Marker({
	    map: null,
	    icon: image,
	    position: place
	  });


	  if (is_vegan) {
	  	veganPins.push(marker);
	  	console.log("pushing vegan pins")
	  } else {
	  	glutenPins.push(marker);
	  	console.log("pushing GF pins")
	  }

	  // console.log("VEGAN PINS " + veganPins)
	  // console.log("GLUTEN PINS " + glutenPins)

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

	// function createMarkerV(place, is_vegan) {
	//   var image = "assets/marker-v-web.png"
	//   var marker = new google.maps.Marker({
	//     map: map,
	//     icon: image,
	//     position: place
	//   });

	//   veganPins.push(marker);

	//   google.maps.event.addListener(marker, 'click', function() {
	//     var options = {
	//     	map: map,
	//     	position: sanFrancisco, //place.geometry.location,
	//     	content: "IFFF YOUUURE GOINNG TOO SANNN FFRRSNNSXCOIIOOOOO"
	//     }

	//     // var infowindow = new google.maps.InfoWindow(options);

	//     // infowindow.setContent(place.name);
	//     // infowindow.open(map, this);
	//   });
	// }



	$('#navSearchForm').submit(function(e){
		e.preventDefault();
		// ids = []
		// $('.aPlace').remove()
		// formData.name = $('#bestKeyword').val();
		// console.log(formData.name)
		//need to create google.maps.LatLng object from city search to be stored
		//request.location below and map.center
		formData.city = $('#searchedLocation').val();
		
		// initialize();
		
	})

  var markerAlready = false
	function getLocation() {
	  if ("geolocation" in navigator) {
	      changeButtonText();
	   navigator.geolocation.getCurrentPosition(function (position) {
	     // console.log(position.coords.latitude, position.coords.longitude);
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

	function centerOnUserLocation(location) {
		if ("geolocation" in navigator) {
		 navigator.geolocation.getCurrentPosition(function (position) {
		   // console.log(position.coords.latitude, position.coords.longitude, "SHAKE IT BABY");
		   myLatLong = new google.maps.LatLng(position.coords.latitude, position.coords.longitude)
		   map.setCenter(myLatLong);

		 });
	} 

		
	

		if("geolocation" in navigator){
		      	// console.log("GOT to geocoder")
		      	// change to make address the coordinates of the user, or make the geocoder = to the user address
		      	address = formData.city
		      	geocoder = new google.maps.Geocoder();
		      	geocoder.geocode( { 'address': address}, function(results, status) {
		      	      if (status == google.maps.GeocoderStatus.OK) {
		      	        
		      	        location = results[0].geometry.location
		      	        // console.log(location)
		      	        map.setCenter(results[0].geometry.location);

		      	      } else {
		      	        // alert("Geocode was not successful for the following reason: " + status);
		      	      }
		      	    });
		      } // END IF




	 }

	function changeButtonText(){
	  window.setTimeout(function() {
	    $("#myLocation").children().text("Finding You...");
	    $("#myLocation").children().css("color","blue")
	    }, 100)
	  // $("#myLocation").children().addClass('fade')



	}
 	var locationLatLng
	

	$('#gluten-event').change(function(){
		if ($('#gluten-event').parent().hasClass('off')){
			$('.aGlutenFreePlace').remove()
			//remove pins

			for (var i = 0; i < glutenPins.length; i++) {
			    glutenPins[i].setMap(null);
			  }

			// glutenPins = []

		} else {

			// console.log(glutenPins)
			for (var i = 0; i < glutenPins.length; i++) {
			    glutenPins[i].setMap(map);
			  }

			scrapeResult.gluten_free.forEach(function(aPlace){
				// console.log(aPlace)
				// locationLatLng = geoCode(aPlace, false)
				
				cutoff = aPlace.search(/\d/)
				placeName = aPlace.slice(0, cutoff)
				placeAddress = aPlace.slice(cutoff, aPlace.length)
<<<<<<< HEAD
				$('#appendPlaces').first().append('<div class="aGlutenFreePlace"><p class="warning">'+ placeName + '</p><p>'+ placeAddress +'</p></div>')
				$('p.warning').css('margin-bottom', '5px')
=======
				$('#appendPlaces').first().append('<div class="aGlutenFreePlace"><p class="warning">'+ placeName + '</p><p>'+ placeAddress +'</p></div><br class="aGlutenFreePlace">')

>>>>>>> JayaDarby-master
				// $('h1').first().append('<div class="aPlace">'+ aPlace +'</div>')
				// createMarker(locationLatLng)
			})
		}
	})

	$('#vegan-event').change(function(){
		if ($('#vegan-event').parent().hasClass('off')){
			$('.aVeganPlace').remove()
			//remove pins
			// console.log(veganPins)

			for (var i = 0; i < veganPins.length; i++) {
			    veganPins[i].setMap(null);
			  }

			// veganPins = []
		} else {

			for (var i = 0; i < veganPins.length; i++) {
			    veganPins[i].setMap(map);
			  }

			scrapeResult.vegan.forEach(function(aPlace){

				222
					aPlace = aPlace.replace(/\\n/gm,"").replace(/"/gm," ");
					cutoff = aPlace.search(/\d/)
					placeName = aPlace.slice(0, cutoff)
					placeAddress = aPlace.slice(cutoff, aPlace.length)

				222

				aPlace = aPlace.replace(/\\n/gm,"").replace(/"/gm," ");

				cutoff = aPlace.search(/\d/)
				placeName = aPlace.slice(0, cutoff)
				placeAddress = aPlace.slice(cutoff, aPlace.length)
				// locationLatLng = geoCode(placeAddress, true)

<<<<<<< HEAD
				$('#appendPlaces').first().append('<div class="aVeganPlace"><p class="success">'+ placeName + '</p><p>'+ placeAddress +'</p></div>')
=======
				$('#appendPlaces').first().append('<div class="aVeganPlace"><p class="success">'+ placeName + '</p><p>'+ placeAddress +'</p></div><br class="aVeganPlace">')
>>>>>>> JayaDarby-master

				// $('h1').first().append('<div class="aPlace">'+ aPlace +'</div>')
				// createMarker(locationLatLng)

<<<<<<< HEAD
				// $('#appendPlaces').first().append('<div class="aPlace"><p class="warning">'+ placeName + '</p><p>'+ placeAddress +'</p></div><br>')
=======
>>>>>>> JayaDarby-master
			})
		}
	})

	// function geoCode(address){
	// 	geocoder = new google.maps.Geocoder();
	// 	geocoder.geocode( { 'address': address}, function(results, status) {
	// 	      if (status == google.maps.GeocoderStatus.OK) {
		        
	// 	        location = results[0].geometry.location
		        // console.log(location)
	// 	        // map.setCenter(results[0].geometry.location);

	// 	        createMarker(location)
	// 		  }
 //  		})
 //  	}
 distanceObj = {};

	function geoCode(address, is_vegan){
		// console.log(address,"*********ADDRESS**********");

		geocoder = new google.maps.Geocoder();
		geocoder.geocode( { 'address': address}, function(results, status) {
		      if (status == google.maps.GeocoderStatus.OK) {
		        
		        location = results[0].geometry.location
		        // console.log(location)
		        // map.setCenter(results[0].geometry.location);
		        // console.log(myLatLong,"*********MYLATLONG**********");

		        console.log(distanceBtwnPoints(myLatLong,location))
		        createMarker(location, is_vegan)
			  } else {
			  	setTimeout(function() { geoCode(address, is_vegan);}, 1000);
			  }
  		})
  	} 	  	

	var veganPins = [];
	var glutenPins = [];

	var scrapeResult;

	$.ajax({
			  type: 'POST',
			  url: '/locations/search',
			  dataType: 'json'
			}).done(function(datas) {
				console.log(datas)
				scrapeResult = datas.result
				// initialize();

				scrapeResult.gluten_free.forEach(function(aPlace){

					aPlace = aPlace.replace(/\\n/gm,"").replace(/"/gm," ");
					cutoff = aPlace.search(/\d/)
					placeAddress = aPlace.slice(cutoff, aPlace.length)
					// console.log(placeAddress,"*********PLACEADDRESS**********");

					geoCode(placeAddress, false)
					// console.log(aPlace)
				})

				scrapeResult.vegan.forEach(function(aPlace){

					aPlace = aPlace.replace(/\\n/gm,"").replace(/"/gm," ");
					cutoff = aPlace.search(/\d/)
					placeAddress = aPlace.slice(cutoff, aPlace.length)
					geoCode(placeAddress, true)
				})

				// scrapeResult.gluten_free.forEach(function(aPlace){
				// 	geoCode(aPlace, false)
				// 	console.log(aPlace)
				// })
			})

})