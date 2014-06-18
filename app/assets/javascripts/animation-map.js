//** Animation Map Module **//

var WS = WS || {}; // app namespace

WS.AnimationMap = function(elem) {
  var self = this;

  // Constants
  var ANIMATION_TIME           = 2000;              // Time in milliseconds
  var DESTINATION_COORDS       = [38.04, -122.79];  // Point Reyes Seashore Lodge
  var DISTANCE_REQUIRED_TO_FLY = 160.934;           // 100 miles = 160.934 KM

  self.elem  = elem;
  self.$elem = $('#' + elem);

  // Helper Methods
  self._deg2rad = function(deg) {
    return deg * (Math.PI/180)
  };

  self._getDistanceInKm = function(lat1,lon1,lat2,lon2) {
    var R    = 6371; // Radius of the earth in km
    var dLat = self._deg2rad(lat2-lat1);
    var dLon = self._deg2rad(lon2-lon1);
    var a    = Math.sin(dLat/2) * Math.sin(dLat/2) +
               Math.cos(self._deg2rad(lat1)) * Math.cos(self._deg2rad(lat2)) *
               Math.sin(dLon/2) * Math.sin(dLon/2);
    var c    = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));

    return R * c;
  };

  // Setup Methods
  self._setCoords = function() {
    var dfr = new $.Deferred();
    var queryUrl;

    self.originLocation = self.$elem.data('origin');

    queryUrl = 'https://maps.googleapis.com/maps/api/geocode/json?address=' + self.originLocation.replace(' ', '+');

    $.ajax({
      type: "GET",
      url: queryUrl
    }).done(function(data) {
      var json = data.results[0]; // Take the first thing the Googs gives us

      self.originCoords      = [json.geometry.location.lat, json.geometry.location.lng];
      self.destinationCoords = DESTINATION_COORDS;
      // self.slope (json.geometry.location.lat - 38.04)/(json.geometry.location.lng + 122.79);

      dfr.resolve();
    }).fail(function(data) {
      self.$elem.hide();
      new Error('Map animation not rendered due to bad google maps query (used to fetch users home coordinates');

      dfr.reject();
    });

    return dfr.promise();
  };

  self._instantiateLeafletMap = function() {
    var options = {
      zoomControl: false,
      keyboard: false,
      dragging: false,
      touchZoom: false,
      scrollWheelZoom: false,
      doubleClickZoom: false,
      boxZoom: false
    };

    self.map = new L.Map(self.elem, options);
  };

  self._setRasterTiles = function() {
    var osmUrl='http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';
    var osm = new L.TileLayer(osmUrl, { minZoom: 0, maxZoom: 12 });

    self.map.setView(self.destinationCoords, 10);
    self.map.addLayer(osm);
  };

  self._setMarkers = function() {
    L.marker(self.originCoords).addTo(self.map);
    L.marker(self.destinationCoords).addTo(self.map);
  };

  self._setBounds = function() {
    self.map.fitBounds([self.originCoords, self.destinationCoords]);
  };

  self._setMarkerDistance = function() {
    self.distanceInKilometers = self._getDistanceInKm(self.originCoords[0], self.originCoords[1], self.destinationCoords[0], self.destinationCoords[1]);
    self.distanceInMeters     = self.distanceInKilometers * 1000;
  };

  self._drawPathBetweenMarkers = function() {
    self.mapPath = new L.polyline([self.originCoords, self.destinationCoords], {color: 'red'}).addTo(self.map);
  };

  self._setMapIcon = function() {
    var vehicle = (self.distanceInKilometers > DISTANCE_REQUIRED_TO_FLY) ? 'airport' : 'car';

    self.vehicleIcon = new L.icon({
      iconUrl: '/assets/images/' + vehicle + '-24.png',
      iconSize: [24, 24],
      // iconAngle: slope,
      shadowUrl: null
    });
  };

  self._createAnimatedMarkerInstance = function() {
    self.animatedMaker = L.animatedMarker(self.mapPath.getLatLngs(), {
      icon: self.vehicleIcon,
      distance: self.distanceInMeters,
      interval: ANIMATION_TIME,
      autoStart: false
    });

    self.map.addLayer(self.animatedMaker);
  };

  self._setScrollHandler = function() {
    var $window = $(window);

    $window.on('scroll.map', function() {
      var docViewTop    = $window.scrollTop();
      var docViewBottom = docViewTop + $window.height();
      var elemTop       = self.$elem.offset().top;
      var elemBottom    = elemTop + self.$elem.height();

      var mapIsInView   = ((elemBottom >= docViewTop) && (elemTop <= docViewBottom)
                        && (elemBottom <= docViewBottom) &&  (elemTop >= docViewTop) );

      if (mapIsInView) {
        self.animatedMaker.start();
        $window.off('scroll.map')
      }
    })
  };

  self.init = function() {
    $.when(self._setCoords()).then(function() {
      self._instantiateLeafletMap();
      self._setRasterTiles();
      self._setMarkers();
      self._setBounds();
      self._setMarkerDistance();
      self._drawPathBetweenMarkers();
      self._setMapIcon();
      self._createAnimatedMarkerInstance();
      self._setScrollHandler();
    });

    return self;
  };

  return self;
};


