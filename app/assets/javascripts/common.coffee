$(document).ready ->
  setTimeout slideNotifications, 3000

$(document).on 'page:load', ->
  setTimeout slideNotifications, 3000

slideNotifications = ->
  if $('.notifications').length > 0
    $('.notifications section').fadeOut('slow')
