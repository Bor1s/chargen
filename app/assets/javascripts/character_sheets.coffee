# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
#
# Hack to make form button enable again
# after target: blank submission
$(window).focus ->
  if $('#submit_char').length > 0
    $('#submit_char').removeProp('disabled')
