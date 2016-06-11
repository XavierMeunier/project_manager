window.App ||= {}

App.init = ->
  # To init on all pages

$(document).on "page:change", ->
  App.init()