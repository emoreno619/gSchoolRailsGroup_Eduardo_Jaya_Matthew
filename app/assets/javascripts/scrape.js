$(function(){
	// $('#searchForm').submit(function (e){
	// 	e.preventDefault();
		
	// 	console.log($('#keyword').val())
	// 	searchQuery = {}
	// 	searchQuery.keyword = $('#keyword').val()
	// 	searchQuery.location = $('#location').val()
		
	// 	$.ajax({
	// 			  type: 'POST',
	// 			  url: '/locations/search',
	// 			  data: searchQuery,
	// 			  dataType: 'json'
	// 			}).done(function(datas) {
	// 				console.log(datas)
	// 			})

	// })

	var scrapeResult;

	$.ajax({
			  type: 'POST',
			  url: '/locations/search',
			  dataType: 'json'
			}).done(function(datas) {
				console.log(datas)
				scrapeResult = datas.result
			})

	$('#gluten-event').change(function(){
		
		if ($('#gluten-event').parent().hasClass('off')){
			$('.aPlace').remove()
		} else {
			scrapeResult.gluten_free.forEach(function(aPlace){
				cutoff = aPlace.search(/\d/)
				placeName = aPlace.slice(0, cutoff)
				placeAddress = aPlace.slice(cutoff, aPlace.length)
				$('#appendPlaces').first().append('<div class="aPlace"><p class="warning">'+ placeName + '</p><p>'+ placeAddress +'</p></div><br>')

			})
		}
	})

});
