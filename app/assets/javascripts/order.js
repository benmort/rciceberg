var Selfstarter;

Selfstarter = {
  firstTime: true,
  validateEmail: function() {
    if (/^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/.test($("#email").val())) {
      $("#email").removeClass("highlight");
      return $("#master_checkout_button").removeClass("disabled");
    } else {
      if (!Selfstarter.firstTime) {
        $("#email").addClass("highlight");
      }
      if (!$("#master_checkout_button").hasClass("disabled")) {
        return $("#master_checkout_button").addClass("disabled");
      }
    }
  },
  init: function() {
    var checkoutOffset, onScroll, updateCartQuantityChange;
    checkoutOffset = $('body').height() - $('.footer').outerHeight();
    $("#email").bind("textchange", function() {
      return Selfstarter.validateEmail();
    });
    $("#email").bind("hastext", function() {
      return Selfstarter.validateEmail();
    });
    $("#email").change(function() {
      return Selfstarter.firstTime = false;
    });
    $(".button").on("click", function() {
      var $button, newVal, oldValue;
      $button = $(this);
      oldValue = $button.parent().find("input").val();
      if ($button.text() === "+") {
        newVal = parseFloat(oldValue) + 1;
      } else {
        if (oldValue > 0) {
          newVal = parseFloat(oldValue) - 1;
          if (newVal === 0) {
            newVal = 1;
          }
        } else {
          newVal = 1;
        }
      }
      $button.parent().find("input").val(newVal);
      return updateCartQuantityChange(newVal);
    });
    $("#amazon_checkout_button").click(function() {
      $("#paypal_payment_method").prop("checked", false);
      return $("#amazon_payment_method").prop("checked", true);
    });
    $("#paypal_checkout_button").click(function() {
      $("#amazon_payment_method").prop("checked", false);
      return $("#paypal_payment_method").prop("checked", true);
    });
    updateCartQuantityChange = function(quantityVal) {
      $("#summary_product_quantity").html(quantityVal);
      total_price = parseFloat(quantityVal) * parseFloat($('#summary_product_price').attr('price-float'));
      $('#summary_product_price_total').html('$' + total_price);
    };
    $("#video_image").on("click", function() {
      $("#player").removeClass("hidden");
      $("#player").css('display', 'block');
      return $(this).hide();
    });
    if ($('.payment_options').length > 0) {
      onScroll = function() {
        var wrapper;
        wrapper = $('.checkout_controls_wrapper');
        if ($(window).scrollTop() + $(window).height() < checkoutOffset) {
          return wrapper.addClass('fix_to_bottom');
        } else if (wrapper.hasClass("fix_to_bottom")) {
          return wrapper.removeClass('fix_to_bottom');
        }
      };
      $(window).on("scroll", function() {
        return onScroll();
      });
      return $('.payment_options ol li').on("click", function() {
        if ($(this).children(".payment_radio").attr("disabled") === "disabled") {
          return false;
        }
        $(".payment_radio").parents("ol>li").removeClass("checkout_option_selected");
        $(this).addClass("checkout_option_selected");
        $(this).children(".payment_radio").attr("checked", "checked");
        onScroll();
        return $('.checkout_controls_wrapper').addClass("checkout_ready");
      });
    }
  }
};

$(function() {
  Selfstarter.init();
  if ($('.payment_options').length === 0) {
    return $("#email").focus();
  }
});
