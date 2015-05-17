
window.vbox = window.vbox || {};

// If we're on a dev server
if (window.location.origin.search(/localhost|dev|127.0.0.1/) != -1) {
  Stripe.setPublishableKey('pk_test_7RRyH8dNiV63d3ZWZciiRB1m');
}
else {
  // use the prod key
  Stripe.setPublishableKey('pk_live_50PwszygsowpvarzIyo63JHv');
}

window.vbox.payment = {
  $form: $('#payment-form'),

  init: function() {
    // bind the modal for the "try now" buttons on the home page
    this.setupPaymentModal();

    this.setupPrettifiedCreditCard();

    this.bindEvents();
  },

  bindEvents: function() {
    this.bindPaymentSubmission();
    this.setupCreditCardExpiry();
  },

  setupCreditCardExpiry: function() {
    var self = this;
    this.$form.find('.expiry-combined').on('change', function() {
      var expiry = self.$form.find('.expiry-combined').val().split('/');

      if (expiry.length === 2) {
        var expiryDates = {
          month: expiry[0].replace(/\s/g, ''),
          year: expiry[1].replace(/\s/g, ''),
        }

        self.$form.find('.expiry-month').val(expiryDates.month);
        self.$form.find('.expiry-year').val(expiryDates.year);
      } else {
        // expiry isn't valid (yet?)
      }
    });
  },

  bindPaymentSubmission: function() {
    var self = this;
    this.$form.submit(function(e) {
      var $form = $(this);

      // Disable the submit button to prevent repeated clicks
      $form.find('button').prop('disabled', true);

      Stripe.card.createToken($form, self.stripeResponseHandler);

      // Prevent the form from submitting with the default action
      return false;
    });
  },

  setupPrettifiedCreditCard: function() {
    // Pretty card
    $('.payment-form').card({
        // a selector or DOM element for the container
        // where you want the card to appear
        // *required*
        container: '.credit-card-display',

        formSelectors: {
          cvcInput: 'input.cvv',
          numberInput: 'input.number',
          expiryInput: 'input.expiry-combined',
          nameInput: 'input.name'
        }
    });
  },

  setupPaymentModal: function() {
    // buy button modal
    $("a.leanModal").leanModal({
      top: 10
    });
  },

  stripeResponseHandler: function (status, response) {
    var $form = $('#payment-form');

    if (response.error) {
      // Show the errors on the form
      $form.find('.payment-errors').text(response.error.message);
      $form.find('button').prop('disabled', false);
    } else {
      // token contains id, last4, and card type
      var token = response.id;
      // Insert the token into the form so it gets submitted to the server
      $form.append($('<input type="hidden" name="stripeToken" />').val(token));
      // and re-submit
      $form.get(0).submit();
    }
  },

  showError: function (message) {
    $("#flash-messages").html('<div class="alert alert-warning"><a class="close" data-dismiss="alert">×</a><div id="flash_alert">' + message + '</div></div>');
    $('.alert').delay(5000).fadeOut(3000);
  }
};

window.vbox.payment.init();
