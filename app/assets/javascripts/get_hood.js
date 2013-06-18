
function findHood(address){
	var sw = new google.maps.LatLng(37.6,-122.5);
  var ne = new google.maps.LatLng(37.83, -122.38);
  var bounds = new google.maps.LatLngBounds(sw, ne);
  var geocoder = new google.maps.Geocoder();
	geocoder.geocode( {'address': address, 'bounds': bounds}, function(results, status){
		if (status == google.maps.GeocoderStatus.OK){
			var hood = results[0].address_components[2].long_name;
      var addressField = '<input id="neighborhood_name" name="neighborhood_name" size="30" type="text">';
      addressField = $(addressField);
      addressField.val(hood);
      $('.controls').detach();
      $('.alt_hood_find').detach();
      $('#find_hood').before(addressField);
      $('#find_hood').detach();
    }
    else {
      alert("Address geocode not successful");
    }
	});
}



$(document).on('click', '#find_hood', function() {
	var address = $('#listing_address').val();
  findHood(address);
});