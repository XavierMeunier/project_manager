window.App ||= {}

App.init = ->
  # Initialize tooltip on bootstrap
  $("a, span, i, div").tooltip()

$(document).on "page:change", ->
  App.init()