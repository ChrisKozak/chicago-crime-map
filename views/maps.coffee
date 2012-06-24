window.initialize = ->
  myOptions =
    center: new google.maps.LatLng(41.89096452734874, -87.61635775500169)
    zoom: 14
    mapTypeId: google.maps.MapTypeId.ROADMAP
  map = new google.maps.Map(document.getElementById("map_canvas"), myOptions)
  bounds = new google.maps.LatLngBounds()
  $(".crime").each (index, element) ->
    position = new google.maps.LatLng($(element).data("lat"), $(element).data("long"))
    infowindow = new google.maps.InfoWindow
      content: """
        <h1>#{$(element).data("type")}</h1>
        #{$(element).data("description")}
        #{$(element).data("location-description")}
        """
    marker = makeMarker(map, position)

    google.maps.event.addListener(marker, 'click', ->
      infowindow.open(map, marker)
    )

    bounds.extend(position)
  map.fitBounds(bounds)

makeMarker = (map, position) ->
  new google.maps.Marker
    title: "Crime!"
    clickable: true
    map: map
    position: position
