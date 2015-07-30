

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

	// var scrapeResult;

	// $.ajax({
	// 		  type: 'POST',
	// 		  url: '/locations/search',
	// 		  dataType: 'json'
	// 		}).done(function(datas) {
	// 			console.log(datas)
	// 			scrapeResult = datas.result
	// 		})

	// $('#gluten-event').change(function(){
		
	// 	if ($('#gluten-event').parent().hasClass('off')){
	// 		$('.aPlace').remove()
	// 	} else {
	// 		scrapeResult.gluten_free.forEach(function(aPlace){
				// $('h1').append('<div class="aPlace">'+ aPlace +'</div>')

	// 		})
	// 	}
	// })

});
