$(document).ready ->
  setTimeout slideNotifications, 2000

$(document).on 'page:load', ->
  setTimeout slideNotifications, 2000

slideNotifications = ->
  if $('.notifications').length > 0
    $('.notifications').slideUp('slow')
