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

				})

	})
});
