class App.Geolocation
  # Set field to fill latitude & longitude
  constructor: (address_field_id) ->
    this.address_field_id = address_field_id
    return

  # Give feedback to users on geolocation search
  set_search_in_progress: ->
    $(this.address_field_id).val("Search in progress...")
    return

  # Give feedback to users when errors occur
  set_search_failed: (message)->
    $(this.address_field_id).val("Search of position failed: " + message)
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
        this.set_search_failed("Timeout")
      when error.PERMISSION_DENIED
        # If permission denied is due to browser (Chrome on HTTPS) or user (do not continue if it's user's will)
        if error.message.indexOf('Only secure origins are allowed') == 0
          this.try_api.call(this)
        else
          this.set_search_failed("Permission denied")
      when error.POSITION_UNAVAILABLE
        console.log 'Browser geolocation error !\n\nPosition unavailable.'
        this.set_search_failed("Position unavailable")
    return

  # Fing position of visitor through HTML5
  find_position: (force = false)->
    geo = this
    geo.force = force
    geo.set_search_in_progress.call(geo)
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

$(document).on "page:change", ->
  # Continue geolocation on new, create, edit and update
  return if $(".projects.new").length <= 0 && $(".projects.edit").length <= 0 && $(".projects.create").length <= 0 && $(".projects.update").length <= 0

  # TO DO:: Manual update of project location
  $('#project_address_find').on 'click', (e) ->
    event.preventDefault()
    geo = new App.Geolocation("#project_address")
    geo.find_position(true)
    return

