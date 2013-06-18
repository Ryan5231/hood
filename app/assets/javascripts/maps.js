
function initialize() {
  var listings = $('#map-canvas').data().listings;
  var hood = $('#map-canvas').data().hood;
  var mapOptions = {
    zoom: 15,
    center: new google.maps.LatLng(0,0),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
  setHoodCenter(hood, map);
  listings.forEach(markListing, map);
}

function setHoodCenter(hood_name, map) {
  var sw = new google.maps.LatLng(37.6,-122.5);
  var ne = new google.maps.LatLng(37.83, -122.38);
  var bounds = new google.maps.LatLngBounds(sw, ne);
  var geocoder = new google.maps.Geocoder();
  geocoder.geocode( {'address': hood_name, 'bounds': bounds}, function(results, status){
    if (status == google.maps.GeocoderStatus.OK){
      map.setCenter(results[0].geometry.location);
    }
    else {
      alert("Neighborhood geocode not successful");
    }
  });
}

function markListing(listing){
  var map = this;
  var address = listing.address;
  var title = listing.title;
  var geocoder = new google.maps.Geocoder();
  geocoder.geocode({ 'address': address }, function(results, status){
    if (status == google.maps.GeocoderStatus.OK){
      dropPin(listing, results[0].geometry.location, map);
    }
    else {
      alert("Listing geocode not successful");
    }
  });
}

function setInfoWindow(listing, map, marker){
  var listing_info = '<h4>' + listing.title + '</h4><p><a href=/listings/' + listing.id + '>view this listing</a></p>';
  var infowindow = new google.maps.InfoWindow({
    content: listing_info
  });
  google.maps.event.addListener(marker, 'click', function(){
    infowindow.open(map,marker);
  });
}

function dropPin(listing, location, map) {
  var myPin = new google.maps.Marker({
    position: location,
    title: listing.title
  });
  myPin.setMap(map);
  setInfoWindow(listing, map, myPin);
}

function loadMapScript() {
  var script = document.createElement("script");
  script.type = "text/javascript";
  script.src = "http://maps.googleapis.com/maps/api/js?key=AIzaSyDptMR6xnHBRufnYLWlnEWrZs75Zt37WTo&sensor=false&callback=initialize";
  document.head.appendChild(script);
}

function conditionalLoad() {
  if ( $('#map-canvas').length != 0) {
    loadMapScript();
  }
}

window.onload = conditionalLoad;
