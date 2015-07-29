$(function(){
	$('#searchForm').submit(function (e){
		e.preventDefault();
		
		console.log($('#keyword').val())
		searchQuery = {}
		searchQuery.keyword = $('#keyword').val()
		searchQuery.location = $('#location').val()
		
		$.ajax({
				  type: 'POST',
				  url: '/locations/search',
				  data: searchQuery,
				  dataType: 'json'
				}).done(function(datas) {
					console.log(datas)
				})

	})
	// $.ajax({
	// 		  type: 'POST',
	// 		  url: '/locations/search',
	// 		  dataType: 'json'
	// 		}).done(function(datas) {

	// 		})

	$('#gluten-event').change(function(){
		console.log("TOGGLED ON")

	})

});
