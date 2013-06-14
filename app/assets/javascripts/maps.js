
function initialize() {
  var geocoder = new google.maps.Geocoder();
  var hood = $('#map-canvas').data().hood;
  geocoder.geocode( {'address': hood}, function(results, status){
    var lat = results[0].geometry.location.jb;
    var lng = results[0].geometry.location.kb;
    var mapOptions = {
      zoom: 14,
      center: new google.maps.LatLng(lat, lng),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
  })
}

function loadScript() {
  var script = document.createElement("script");
  script.type = "text/javascript";
  script.src = "http://maps.googleapis.com/maps/api/js?key=AIzaSyDptMR6xnHBRufnYLWlnEWrZs75Zt37WTo&sensor=false&callback=initialize";
  document.body.appendChild(script);
}

window.onload = loadScript;