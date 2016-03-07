$(document).ready(function(){
	document.addEventListener('page:change', function() {
		componentHandler.upgradeDom();
	});

	$('.prevenir').click(function(event) {
		event.preventDefault();
	});
	var contenedor = $('#insert-acordes');
	var cont_acordes = $('#current-acorde');
	var cont_descripcion = $('#current-descripcion');
	$('.get-acorde').click(function(event) {
		event.preventDefault();
		var url = $(this).attr('href');
		$.get( url, function(data) {
			$(cont_acordes).text(data.acorde);
			$(cont_descripcion).text(data.descripcio);
		});

	});
});