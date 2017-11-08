function iuguApi() {
  if ($('.payment-form').length) {
    var accountID = $('#payment-form').data('account');
    var testMode = $('#payment-form').data('test');
    Iugu.setAccountID(accountID);
    Iugu.setTestMode(testMode ? testMode : true);
    Iugu.setup();
  }

  $('#payment-form').submit(function(event) {
    $('#error-list').empty();
    var form = $(this);
    $('button[type=submit]').attr('disabled', true);

    var tokenResponseHandler = function(data) {
      if (data.errors) {
        $('#error-box').removeClass('hidden');
        errors = JSON.stringify(data.errors);
        $.each(data.errors, function(index, error) {
          $('#error-list').append(
            $('<li></li>').text(index + ': ' + error)
          )
        });
        $('button[type=submit]').attr('disabled', false);
      }
      else {
        $("#token").val(data.id);
        form.get(0).submit();
      }
    }

    Iugu.createPaymentToken(this, tokenResponseHandler);
    return false;
  });
}
