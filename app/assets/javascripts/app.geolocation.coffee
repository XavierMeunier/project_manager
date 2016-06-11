class App.Geolocation
  # Set field to fill latitude & longitude
  constructor: (address_field_id) ->
    this.address_field_id = address_field_id
    return

  # Write address in input field
  get_address: ->
    geo = this
    if geo.address_field_id
      address_field = $(geo.address_field_id)
      if !address_field.val() || geo.force
        jQuery.post("https://maps.googleapis.com/maps/api/geocode/json?latlng="+geo.lat+","+geo.long+"&key=AIzaSyD7GrDMhokm0wUdNDnIIg6pHZtzcQCJZMo&location_type=ROOFTOP", (success) ->
          geo.address = success.results[0].formatted_address
          address_field.val(geo.address)
          return
        ).fail (err) ->
          console.log 'API Inverse geocode error! ' + err
          console.log err
        return
      return
    return

  # Locate user through Gmaps API
  try_api: ->
    geo = this
    jQuery.post("https://www.googleapis.com/geolocation/v1/geolocate?key=AIzaSyD7GrDMhokm0wUdNDnIIg6pHZtzcQCJZMo", (success) ->
      geo.lat = success.location.lat
      geo.long = success.location.lng
      geo.get_address.call(geo)
      return
    ).fail (err) ->
      console.log 'API Geolocation error! ' + err
      console.log err
      return
    return

  # Handle failed geolocation through HTML5
  browser_fail: (error) ->
    switch error.code
      when error.TIMEOUT
        console.log 'Browser geolocation error !\n\nTimeout.'
      when error.PERMISSION_DENIED
        # If permission denied is due to browser (Chrome on HTTPS) or user (do not continue if it's user's will)
        if error.message.indexOf('Only secure origins are allowed') == 0
          this.try_api.call(this)
      when error.POSITION_UNAVAILABLE
        console.log 'Browser geolocation error !\n\nPosition unavailable.'
    return

  # Fing position of visitor through HTML5
  find_position: (force = false)->
    geo = this
    geo.force = force
    if navigator.geolocation
      navigator.geolocation.getCurrentPosition ((position) ->
        geo.lat = position.coords.latitude
        geo.long = position.coords.longitude
        geo.get_address.call(geo)
      ), ((error) ->
        geo.browser_fail.call(geo, error)
      ),
      maximumAge: 50000
      timeout: 20000
      enableHighAccuracy: true
    return

typewatch = do ->
  timer = 0
  (callback, ms) ->
    clearTimeout timer
    timer = setTimeout(callback, ms)
    return

$(document).on "page:change", ->
  # Continue geolocation on new, create, edit and update
  return if $(".projects.new").length <= 0 && $(".projects.edit").length <= 0 && $(".projects.create").length <= 0 && $(".projects.update").length <= 0

  # TO DO:: Manual update of project location
  $('#project_address_find').on 'click', (e) ->
    event.preventDefault()
    geo = new App.Geolocation("#project_address")
    geo.find_position(true)
    return

