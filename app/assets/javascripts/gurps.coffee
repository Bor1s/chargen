window.Gurps ||= {}

Gurps.init = ->
  this.applyScrolls()
  system = $('#system').val()
  if system? && system == 'gurps'
    this.applyAutomaticCalculations()

Gurps.applyAutomaticCalculations = ->
  this.calculateBasicLift()
  this.calculateBasicSpeedAndMove()
  this.calculateTotalCost()
  this.calculateTotalWeight()

Gurps.calculateBasicLift = ()->
  self = this
  basicLift         = $('#character_sheet_basic_lift')
  st                = $('#character_sheet_st')
  st.on 'mouseup keyup', ()->
    stVal     = parseInt(st.val())
    number = Math.floor(stVal * stVal / 5) || 0
    basicLift.val(number)
    self.setEncumbrance(number)
  # In case user manually enters data
  # to basicLift field
  basicLift.on 'mouseup keyup', ->
    self.setEncumbrance(parseInt(basicLift.val()))

Gurps.setEncumbrance = (number)->
  noneEncumbrance   = $('#character_sheet_enc_none')
  lightEncumbrance  = $('#character_sheet_enc_light')
  mediumEncumbrance = $('#character_sheet_enc_medium')
  heavyEncumbrance  = $('#character_sheet_enc_heavy')
  xheavyEncumbrance = $('#character_sheet_enc_xheavy')

  noneEncumbranceRO   = $('#GURPS_enc_none')
  lightEncumbranceRO  = $('#GURPS_enc_light')
  mediumEncumbranceRO = $('#GURPS_enc_medium')
  heavyEncumbranceRO  = $('#GURPS_enc_heavy')
  xheavyEncumbranceRO = $('#GURPS_enc_xheavy')

  numberLight = (number * 2) || 0
  numberMedium = (number * 3) || 0
  numberHeavy = (number * 6) || 0
  numberXHeavy = (number * 10) || 0

  noneEncumbrance.val(number || 0)
  lightEncumbrance.val(numberLight)
  mediumEncumbrance.val(numberMedium)
  heavyEncumbrance.val(numberHeavy)
  xheavyEncumbrance.val(numberXHeavy)

  noneEncumbranceRO.text(number || 0)
  lightEncumbranceRO.text(numberLight)
  mediumEncumbranceRO.text(numberMedium)
  heavyEncumbranceRO.text(numberHeavy)
  xheavyEncumbranceRO.text(numberXHeavy)

Gurps.setMove = (number)->
  noneMove   = $('#character_sheet_bmnone')
  lightMove  = $('#character_sheet_bmlight')
  mediumMove = $('#character_sheet_bmmedium')
  heavyMove  = $('#character_sheet_bmheavy')
  xheavyMove = $('#character_sheet_bmxheavy')

  noneMoveRO   = $('#GURPS_bmnone')
  lightMoveRO  = $('#GURPS_bmlight')
  mediumMoveRO = $('#GURPS_bmmedium')
  heavyMoveRO  = $('#GURPS_bmheavy')
  xheavyMoveRO = $('#GURPS_bmxheavy')

  numberLight = parseInt((number * 0.8).toFixed(1)) || 0
  numberMedium = parseInt((number * 0.6).toFixed(1)) || 0
  numberHeavy = parseInt((number * 0.4).toFixed(1)) || 0
  numberXHeavy = parseInt((number * 0.2).toFixed(1)) || 0

  noneMove.val(number || 0)
  lightMove.val(numberLight)
  mediumMove.val(numberMedium)
  heavyMove.val(numberHeavy)
  xheavyMove.val(numberXHeavy)

  noneMoveRO.text(number || 0)
  lightMoveRO.text(numberLight)
  mediumMoveRO.text(numberMedium)
  heavyMoveRO.text(numberHeavy)
  xheavyMoveRO.text(numberXHeavy)

Gurps.setDodge = (basicSpeed)->
  number      = parseInt(basicSpeed) + 3
  noneDodge   = $('#character_sheet_dodgenone')
  lightDodge  = $('#character_sheet_dodgelight')
  mediumDodge = $('#character_sheet_dodgemedium')
  heavyDodge  = $('#character_sheet_dodgeheavy')
  xheavyDodge = $('#character_sheet_dodgexheavy')

  noneDodgeRO   = $('#GURPS_dodgenone')
  lightDodgeRO  = $('#GURPS_dodgelight')
  mediumDodgeRO = $('#GURPS_dodgemedium')
  heavyDodgeRO  = $('#GURPS_dodgeheavy')
  xheavyDodgeRO = $('#GURPS_dodgexheavy')

  numberLight = parseInt(number - 1) || 0
  numberMedium = parseInt(number - 2) || 0
  numberHeavy = parseInt(number - 3) || 0
  numberXHeavy = parseInt(number - 4) || 0

  noneDodge.val(number || 0)
  lightDodge.val(numberLight)
  mediumDodge.val(numberMedium)
  heavyDodge.val(numberHeavy)
  xheavyDodge.val(numberXHeavy)

  noneDodgeRO.text(number || 0)
  lightDodgeRO.text(numberLight)
  mediumDodgeRO.text(numberMedium)
  heavyDodgeRO.text(numberHeavy)
  xheavyDodgeRO.text(numberXHeavy)

Gurps.calculateBasicSpeedAndMove = ->
  self = this
  basicSpeed = $('#character_sheet_basic_speed')
  basicMove  = $('#character_sheet_basic_move')
  ht         = $('#character_sheet_ht')
  dx         = $('#character_sheet_dx')
  $('#character_sheet_ht, #character_sheet_dx').on 'mouseup keyup', ()->
    htVal     = parseInt(ht.val())
    dxVal     = parseInt(dx.val())
    basicSpeedVal = ((htVal + dxVal) / 4) || 0
    basicMoveVal = Math.floor(basicSpeedVal)
    basicSpeed.val(basicSpeedVal)
    basicMove.val(basicMoveVal)
    self.setMove(basicMoveVal)
    self.setDodge(basicSpeedVal)
  # In case user manually enters data
  # to basicSpeed field
  basicSpeed.on 'mouseup keyup', ->
    moveVal = Math.floor(parseInt(basicSpeed.val())) || 0
    basicMove.val(moveVal)
    self.setMove(moveVal)
    self.setDodge(moveVal)
  # In case user manually enters data
  # to basicMove field
  basicMove.on 'mouseup keyup', ->
    moveVal = Math.floor(parseInt(basicMove.val())) || 0
    self.setMove(moveVal)

Gurps.applyScrolls = ->
  controller = new ScrollMagic.Controller()
  topOffset = 55 # pixels
  # Change behaviour of controller to animate scroll instead of jump
  controller.scrollTo (newpos)->
    TweenMax.to(window, 0.7, {scrollTo: {y: newpos - topOffset, autoKill: false}})

  $('[data-trigger="anchor"]').on 'click', (e)->
    id = $(this).attr('href')
    if ($(id).length > 0)
      e.preventDefault()
      # Trigger scroll
      controller.scrollTo(id)

Gurps.calculateTotalCost = ->
  totalCost = $('#character_sheet_totalcost')
  $('[data-cost="true"]').on 'mouseup keyup', ->
    allCosts = $('[data-cost="true"]').map(() ->
      parseInt(this.value) || 0).get()
    total = allCosts.reduce (x,y) ->
      x + y
    totalCost.val(total)

Gurps.calculateTotalWeight = ->
  totalWeight = $('#character_sheet_totalweight')
  $('[data-weight="true"]').on 'mouseup keyup', ->
    allWeight = $('[data-weight="true"]').map(() ->
      parseInt(this.value) || 0).get()
    total = allWeight.reduce (x,y) ->
      x + y
    totalWeight.val(total)
