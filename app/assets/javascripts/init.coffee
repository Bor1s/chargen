# JS Application init for turbolincks
# TODO: fix, causing element to load twice
$(document).on 'turbolinks:load', ->
  App.init()

# Regular JS Application init
$ ->
  App.init()

