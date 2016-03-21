$(document).ready(function(){
	document.addEventListener('page:change', function() {
		componentHandler.upgradeDom();
	});

	$('.prevenir').click(function(event) {
		event.preventDefault();
	});
	$('.get-acorde').click(function(event) {
		event.preventDefault();
		var url = $(this).data('direction');
		var version = "#" + $(this).data('version');
		$.get( url, function(data) {
			var chord = getCifrado(data.acorde);
			$(version).children('.current-acorde').html(chord);
			$(version).children('.current-descripcion').text(data.descripcion);
		});

	});
	var activo = $('.is_active');
	var upTexto = $('#aumentar-texto');
	var downTexto = $('#disminuir-texto');
	var upEspacioLineas = $('#aumentar-espacio');
	var downEspacioLineas = $('#disminuir-espacio');
	var reboot = $('#reboot');
	var upTono = $('#aumentar-tono');
	var downTono = $('#disminuir-tono');

	$(upTexto).click( function(){
		var nuevoTamano = parseInt($('.is-active .current-acorde').css("font-size").split("p")[0]) + 1;
		$('.is-active .current-acorde').css('font-size', nuevoTamano);
	});
	$(downTexto).click( function(){
		var nuevoTamano = parseInt($('.is-active .current-acorde').css("font-size").split("p")[0]) - 1;
		$('.is-active .current-acorde').css('font-size', nuevoTamano);
	});
	$(upEspacioLineas).click( function(){
		var nuevoEspacio = parseInt($('.is-active .current-acorde').css('line-height').split("p")[0]) + 1;
		$('.is-active .current-acorde').css('line-height', nuevoEspacio + "px");
	});
	$(downEspacioLineas).click( function(){
		var nuevoEspacio = parseInt($('.is-active .current-acorde').css('line-height').split("p")[0]) - 1;
		$('.is-active .current-acorde').css('line-height', nuevoEspacio + "px");
	});
	$(reboot).click(function() {
		$('.is-active .current-acorde').css('font-size', '14px');
		$('.is-active .current-acorde').css('line-height', '20px');
	});

	$(downTono).click(function () {
  	$('.chord').elb_music_transpose(-1); // transpose down.
  });
	$(upTono).click(function () {
  	$('.chord').elb_music_transpose(1); // transpose up.
  });


	function getCifrado(texto){
		var regexchord = /^[A-G][b\#]?(2|5|6|7|9|11|13|6\/9|7\-5|7\-9|7\#5|7\#9|7\+5|7\+9|7b5|7b9|7sus2|7sus4|add2|add4|add9|aug|dim|dim7|m\/maj7|m6|m7|m7b5|m9|m11|m13|maj7|maj9|maj11|maj13|mb5|m|sus|sus2|sus4)*(\/[A-G][b\#]*)*$/ ;
		var espacios = /(\s|\t)/;
		var nuevotexto = texto.split(espacios).map(function(elem) {
			if (elem.search(regexchord) != -1) {
				return "<span class='chord'>" + elem + "</span>";
			}
			else
			{
				return elem;
			};
		});

		nuevo = nuevotexto.join("");
	return nuevo;
	};

});

