// buy button modal
$("a.leanModal").leanModal({
  top: 10
});

$('.payment-form').on('submit', function(e) {
  // don't submit like normal (maybe only do this after the "model" is valid)
  e.preventDefault();

  // cache the form
  var $form = $(this);

  // validate the form

  // once valid, get the credit card input values
  $form.find('.credit-card input').each(function(elem) {
    // put them into an object or array
    // also remove them from what will be submitted, which you could do by removing the name attribute
  });

  // tokenize the credit card form with stripe.js
  // submit like normal
});
