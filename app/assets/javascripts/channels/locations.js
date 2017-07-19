document.addEventListener("turbolinks:load", function() {
  var locationID = $("[data-location-id]").data("location-id");
  var map = new L.Map('map-'+locationID);

  L.Icon.Default.imagePath = '/assets';

  var osmUrl = 'http://stamen-tiles-{s}.a.ssl.fastly.net/toner-lite/{z}/{x}/{y}.png';
  var osmAttrib = 'Map tiles by <a href="http://stamen.com">Stamen Design</a>, <a href="http://creativecommons.org/licenses/by/3.0">CC BY 3.0</a> &mdash; Map data &copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'

  L.tileLayer(osmUrl, {
    maxZoom: 17,
    minZoom: 3,
    attribution: osmAttrib,
    id: 'examples.map-i875mjb7'
  }).addTo(map);

  L.edgeMarker().addTo(map);

  var marker;

  /* setup initial marker if we already have a user location */
  if(map._container.dataset.lat != '') {
    map.setView([map._container.dataset.lat, map._container.dataset.lng], 13);
    var latlng = L.latLng(map._container.dataset.lat, map._container.dataset.lng);
    marker = L.Marker.movingMarker([latlng]);
    marker.addTo(map);
  } else {
    /* display searching overlay */
    map.setView([100, 200], 13);
    $('.ajax-loader').show();
  }

  var userUpdates = function(message) {
    $('.ajax-loader').hide();

    var latlng = L.latLng(message.lat, message.lng);
    var markerWas = marker;

    if(marker === undefined) {
      marker = L.Marker.movingMarker([latlng]);
      marker.addTo(map);
    }

    marker.moveTo(latlng, 1000);

    /*
      Move to the marker if it's the first time it's been displayed,
      otherwise don't, as the user should control the map from here-on
    */
    if(markerWas === undefined) {
      var group = new L.featureGroup([marker]);
      map.fitBounds(group.getBounds());
    }
  }

  App.cable.subscriptions.create({
    channel: "LocationChannel",
    location_id: locationID
  }, {
    received: function(data) {
      userUpdates(data);
    },
    connected: function() {}
  });
});