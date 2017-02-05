$(document).ready ->
  setTimeout fadeNotifications, 3000
  enablePopovers()
  focusPopoverLink()
  unfocusPopoverLink()
  enableCopyButton()

$(document).on 'turbolinks:load', ->
  setTimeout fadeNotifications, 3000
  enablePopovers()
  focusPopoverLink()
  unfocusPopoverLink()
  enableCopyButton()

$(document).on 'click touchstart', (e)->
  $('[data-toggle="popover"]').each ->
    that = $(this)
    hasTarget = (that.has(e.target).length == 0)
    popoverHasTarget = ($('.popover').has(e.target).length == 0)
    isNotTarget = !that.is(e.target)

    if isNotTarget && hasTarget && popoverHasTarget
      that.popover('hide')

fadeNotifications = ->
  if $('.notifications').length > 0
    $('.notifications section').fadeOut('slow')

enablePopovers = ->
  $('[data-toggle="popover"]').each ->
    popover = $(this)
    popoverContent = $("##{popover.data('content-id')}")
    popover.popover
      container: 'body'
      html: true
      content: ->
        popoverContent.html()

focusPopoverLink = ->
  $('[data-toggle="popover"]').on 'show.bs.popover', ->
    $(this).addClass('focus');

unfocusPopoverLink = ->
  $('[data-toggle="popover"]').on 'hide.bs.popover', ->
    $(this).removeClass('focus');

enableCopyButton = ->
  clipboard = new Clipboard('.copy-button')
  clipboard.on 'success', (e)->
    setTooltip(e.trigger, 'Copied!')
    hideTooltip(e.trigger)

  clipboard.on 'error', (e)->
    setTooltip(e.trigger, 'Failed!')
    hideTooltip(e.trigger)

# Tooltip
enableTooltip = ->
  $('.copy-button').tooltip
    trigger: 'click'

setTooltip = (btn, message)->
  $(btn)
    .tooltip('hide')
    .attr('data-original-title', message)
    .tooltip('show')

hideTooltip = (btn)->
  setTimeout (-> $(btn).tooltip('hide')), 1000

