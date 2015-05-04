RCIceberg =
  firstTime: true
  validateEmail: ->
    # The regex we use for validating email
    # It probably should be a parser, but there isn't enough time for that (Maybe in the future though!)
    if /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/.test($("#email").val())
      $("#email").removeClass("highlight")
      $("#master_checkout_button").removeClass("disabled")
    else
      $("#email").addClass("highlight") unless RCIceberg.firstTime
      $("#master_checkout_button").addClass("disabled") unless $("#master_checkout_button").hasClass("disabled")
  init: ->
    checkoutOffset = $('body').height() - $('.footer').outerHeight() #needs to be done upon init
    $("#email").bind "textchange", ->
      RCIceberg.validateEmail()
    $("#email").bind "hastext", ->
      RCIceberg.validateEmail()
    # The first time they type in their email, we don't want it to throw a validation error
    $("#email").change ->
      RCIceberg.firstTime = false

    $(".button").on "click", ->
      $button = $(this)
      oldValue = $button.parent().find("input").val()
      if $button.text() is "+"
        newVal = parseFloat(oldValue) + 1
      else
        
        # Don't allow decrementing below zero
        if oldValue > 0
          newVal = parseFloat(oldValue) - 1
          if newVal == 0
            newVal = 1
        else
          newVal = 1
      $button.parent().find("input").val newVal
      updateCartQuantityChange newVal

    $("#amazon_checkout_button").click ->
      $("#paypal_payment_method").prop "checked", false
      $("#amazon_payment_method").prop "checked", true

    $("#paypal_checkout_button").click ->
      $("#amazon_payment_method").prop "checked", false
      $("#paypal_payment_method").prop "checked", true

    
    updateCartQuantityChange = (quantityVal) ->
      $("#summary_product_quantity").html quantityVal
      total_price = parseFloat(quantityVal) * parseFloat($('#summary_product_price').attr('price-float'))
      $('#summary_product_price_total').html '$' + total_price
  
    # init placeholder image for video
    $("#video_image").on "click", ->
      $("#player").removeClass("hidden")
      $("#player").css('display', 'block')
      $(this).hide()

    # if they are using the optional payment options section on the checkout page, need to conditional fix the email
    # field and button to the bottom of the page so it's displayed after selecting a radio button
    if $('.payment_options').length > 0

      onScroll = () ->
        wrapper = $('.checkout_controls_wrapper')
        if $(window).scrollTop() + $(window).height() < checkoutOffset
          wrapper.addClass('fix_to_bottom')
        else if wrapper.hasClass("fix_to_bottom")
          wrapper.removeClass('fix_to_bottom')

      $(window).on "scroll", ->
        onScroll()

      # the radio button selection should bring up the email field and button
      $('.payment_options ol li').on "click", ->
        return false if $(this).children(".payment_radio").attr("disabled") == "disabled"
        $(".payment_radio").parents("ol>li").removeClass("checkout_option_selected")
        $(this).addClass("checkout_option_selected")
        $(this).children(".payment_radio").attr "checked", "checked"
        onScroll()
        $('.checkout_controls_wrapper').addClass "checkout_ready"
$ ->
  RCIceberg.init()
  $("#email").focus() if $('.payment_options').length == 0
