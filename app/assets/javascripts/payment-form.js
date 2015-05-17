
window.vbox = window.vbox || {};

window.vbox.payment = {
  $form: $('.payment-form'),

  init: function() {
    // bind the modal for the "try now" buttons on the home page
    this.setupPaymentModal();

    this.setupPrettifiedCreditCard();

    this.bindEvents();
  },

  bindEvents: function() {
    this.bindPaymentSubmission();
  },

  bindPaymentSubmission: function() {
    this.$form.on('submit', function(e) {

      // cache the form
      var $form = $(this);

      // @TODO validate the form

      // Disable the submit so that the user doesn't try again :-)
      $form.find("input[type=submit]").prop("disabled", true);

      // tokenize the credit card form with stripe.js
      Stripe.card.createToken($form, this.stripeResponseHandler);

      // don't submit like normal
      e.preventDefault();
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
          expiryInput: 'input.expiry',
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
    var $form = $("#new_registration");
    if (response.error) {
      debugger;
      this.showError(response.error.message);
      $form.find("input[type=submit]").prop("disabled", false);
    } else {
      var token = response.id;
      $form.append($("<input type=\"hidden\" name=\"registration[card_token]\" />").val(token));
      $("[data-stripe=number]").remove();
      $("[data-stripe=cvv]").remove();
      $("[data-stripe=exp-year]").remove();
      $("[data-stripe=exp-month]").remove();
      $form.get(0).submit();
    }
    return false;
  },

  showError: function (message) {
    $("#flash-messages").html('<div class="alert alert-warning"><a class="close" data-dismiss="alert">×</a><div id="flash_alert">' + message + '</div></div>');
    $('.alert').delay(5000).fadeOut(3000);
  }
};

window.vbox.payment.init();
