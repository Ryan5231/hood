
function showUpdateView(hood){
  var hoodField = '<input id="neighborhood_name" name="neighborhood_name" size="30" type="text" class="controls">';
  var updateButton = '<br /><button id="update_hood" name="button" type="button" class="btn btn-info controls">Update listing neighborhood</button>';
  hoodField = $(hoodField);
  hoodField.val(hood);
  $('#hood-dropdown').detach();
  $('#find_hood').before(hoodField);
  $('#neighborhood_name').after(updateButton);
  $('#find_hood').detach();
}

function findHood(address, bounds){
  var geocoder = new google.maps.Geocoder();
	geocoder.geocode( {'address': address, 'bounds': bounds}, function(results, status){
		if (status == google.maps.GeocoderStatus.OK){
			var hood = results[0].address_components[2].long_name;
      showUpdateView(hood);
    }
    else {
      alert("Address geocode not successful");
    }
	});
}

function updateHood(address, bounds){
  var geocoder = new google.maps.Geocoder();
  geocoder.geocode( {'address': address, 'bounds': bounds}, function(results, status){
    if (status == google.maps.GeocoderStatus.OK){
      var hood = results[0].address_components[2].long_name;
      $('#neighborhood_name').val(hood);
    }
     else {
      alert("Address geocode not successful");
    }
  });
}


$(document).on('click', '#find_hood', function() {
  var sw = new google.maps.LatLng(37.6,-122.5);
  var ne = new google.maps.LatLng(37.83, -122.38);
  var bounds = new google.maps.LatLngBounds(sw, ne);
	var address = $('#listing_address').val();
  findHood(address, bounds);
});

$(document).on('click', '#update_hood', function() {
  var sw = new google.maps.LatLng(37.6,-122.5);
  var ne = new google.maps.LatLng(37.83, -122.38);
  var bounds = new google.maps.LatLngBounds(sw, ne);
  var address = $('#listing_address').val();
  updateHood(address, bounds);
})