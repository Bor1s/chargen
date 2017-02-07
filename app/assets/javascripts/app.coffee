window.App ||= {}

App.init = ->
  setTimeout this.fadeNotifications, 3000
  this.enablePopovers()
  this.focusPopoverLink()
  this.unfocusPopoverLink()
  this.managePopoverCloseOnClick()
  this.enableCopyButton()

App.fadeNotifications = ->
  if $('.notifications').length > 0
    $('.notifications section').fadeOut('slow')

App.enablePopovers = ->
  $('[data-toggle="popover"]').each ->
    popover = $(this)
    popoverContent = $("##{popover.data('content-id')}")
    popover.popover
      container: 'body'
      html: true
      content: ->
        popoverContent.html()

App.focusPopoverLink = ->
  $('[data-toggle="popover"]').on 'show.bs.popover', ->
    $(this).addClass('focus');

App.unfocusPopoverLink = ->
  $('[data-toggle="popover"]').on 'hide.bs.popover', ->
    $(this).removeClass('focus');

App.enableCopyButton = ->
  clipboard = new Clipboard('.copy-button')

  # NOTE: https://github.com/twbs/bootstrap/issues/21607
  # $('.copy-button').tooltip
  #   trigger: 'click'

  # clipboard.on 'success', (e)->
    # App._setTooltip(e.trigger, 'Copied!')
    # App._hideTooltip(e.trigger)
  #
  # clipboard.on 'error', (e)->
  #   App._setTooltip(e.trigger, 'Failed!')
  #   App._hideTooltip(e.trigger)

App.managePopoverCloseOnClick = ->
  $(document).on 'click touchstart', (e)->
    $('[data-toggle="popover"]').each ->
      that = $(this)
      hasTarget = (that.has(e.target).length == 0)
      popoverHasTarget = ($('.popover').has(e.target).length == 0)
      isNotTarget = !that.is(e.target)

      if isNotTarget && hasTarget && popoverHasTarget
        that.popover('hide')

App._setTooltip = (btn, message)->
  $(btn)
    .tooltip('hide')
    .attr('data-original-title', message)
    .tooltip('show')

App._hideTooltip = (btn)->
  setTimeout (-> $(btn).tooltip('hide')), 1000
