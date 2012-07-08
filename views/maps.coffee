window.initialize = ->
  map = MapInitializer().initialize()
  HeatmapInitializer(map).initialize()

HeatmapInitializer = (map) ->
  initialize = ->
    crimeAggregation = CrimeAggregator($(".crime"));
    heatmapOptions =
      map: map
      data: gmapsPointTransformer(crimeAggregation.crimes())
      maxIntensity: crimeAggregation.maxAggregation()
    new google.maps.visualization.HeatmapLayer(heatmapOptions)

  gmapsPointTransformer = (crimeLocations) ->
    return _.map(crimeLocations, (crimeLocation) ->
      weightedLocation =
        location: new google.maps.LatLng(crimeLocation.lat, crimeLocation.lng)
        weight: crimeLocation.count
      return weightedLocation
    )

  return {
    initialize: initialize
  }


MapInitializer = ->
  initialize = ->
    mapOptions =
      center: new google.maps.LatLng(41.89096452734874, -87.61635775500169)
      zoom: 10
      mapTypeId: google.maps.MapTypeId.ROADMAP
    map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions)
    bounds = new google.maps.LatLngBounds()
    $(".crime").each (index, element) ->
      addMarkerToMap(element, map, bounds)
    map.fitBounds(bounds)
    return map

  addMarkerToMap = (element, map, bounds) ->
    position = new google.maps.LatLng($(element).data("lat"), $(element).data("long"))
    infowindow = new google.maps.InfoWindow
      content: """
        <h1>#{$(element).data("type")}</h1>
        #{$(element).data("description")}
        #{$(element).data("location-description")}
        """
    marker = makeMarker(map, position)
    bounds.extend(position)

    google.maps.event.addListener(marker, 'click', ->
      infowindow.open(map, marker)
    )

  makeMarker = (map, position) ->
    new google.maps.Marker
      title: "Crime!"
      clickable: true
      map: map
      position: position

  return {
    initialize: initialize
  }