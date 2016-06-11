class App.Map
  # Initialize map field & style
  constructor: (map_id) ->
    this.map_id = map_id
    this.styles = [{"featureType":"road.arterial","elementType":"geometry.stroke","stylers":[{"color":"#02ae7f"}]},{"featureType":"road.arterial","elementType":"geometry.stroke","stylers":[{"color":"#02ae7f"}]},{"featureType":"road.arterial","elementType":"geometry.fill","stylers":[{"color":"#36c297"}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#7fe3cc"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#027858"}]},{"featureType":"landscape.man_made","elementType":"geometry","stylers":[{"color":"#edffec"}]},{"featureType":"road.highway","elementType":"labels.text.fill","stylers":[{"color":"#ffffff"}]},{"featureType":"road.highway","elementType":"labels.text.stroke","stylers":[{"hue":"#3300ff"}]},{"featureType":"road","elementType":"labels","stylers":[{"hue":"#bfed26"}]}]

  # Find latitude & longitude from address
  display_address: (address) ->
    map = this
    map.address = address
    encoded_address = encodeURIComponent(address);
    jQuery.post("https://maps.googleapis.com/maps/api/geocode/json?address=" + encoded_address + "&key=AIzaSyD7GrDMhokm0wUdNDnIIg6pHZtzcQCJZMo", (success) ->
      lat = Number success.results[0].geometry.location.lat
      long = Number success.results[0].geometry.location.lng
      map.lat_long =
        lat: lat
        lng: long
      map.render.call(map)
      return
    ).fail (err) ->
      console.log 'Error to find address! ' + err
      console.log err
    return

  # Render Gmaps
  render: ->
    this_map = this
    mapOptions =
      zoom: 10
      center: this_map.lat_long
    gmap = new (google.maps.Map)(document.getElementById(this_map.map_id), mapOptions)
    gmap.setOptions styles: this_map.styles

    marker = new google.maps.Marker
      position: this_map.lat_long
      map: gmap
      title: this_map.address

    marker.setIcon('http://maps.google.com/mapfiles/ms/icons/yellow.png')

    return


$(document).on "page:change", ->
  return if $(".projects.show").length <= 0
  map = new App.Map "map"
  map.display_address gon.address
