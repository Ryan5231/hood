
function initialize() {
  var listings = $('#map-canvas').data().listings;
  console.log(listings);
  var hood = $('#map-canvas').data().hood;
  var mapOptions = {
    zoom: 14,
    center: new google.maps.LatLng(0,0),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
  setHoodCenter(hood, map);
  markListing(listings[0], map);
}

function setHoodCenter(hood_name, map) {
  var geocoder = new google.maps.Geocoder();
  geocoder.geocode( {'address': hood_name}, function(results, status){
    if (status == google.maps.GeocoderStatus.OK){
      map.setCenter(results[0].geometry.location);
    }
    else {
      alert("Geocode not successful");
    }
  });
}

function markListing(listing, map){
  var address = listing.address;
  var title = listing.title;
  var geocoder = new google.maps.Geocoder();
  geocoder.geocode({ 'address': address }, function(results, status){
    if (status == google.maps.GeocoderStatus.OK){
      console.log(results);
      dropPin(title, results[0].geometry.location.jb, results[0].geometry.location.kb, map);
    }
    else {
      alert("Geocode not successful");
    }
  });
}


function dropPin(title, lat, lng, map) {
  var myLatlng = new google.maps.LatLng(lat, lng);
  var myPin = new google.maps.Marker({
    position: myLatlng,
    title: title
  });
  myPin.setMap(map);
}

function loadScript() {
  var script = document.createElement("script");
  script.type = "text/javascript";
  script.src = "http://maps.googleapis.com/maps/api/js?key=AIzaSyDptMR6xnHBRufnYLWlnEWrZs75Zt37WTo&sensor=false&callback=initialize";
  document.body.appendChild(script);
}

window.onload = loadScript;