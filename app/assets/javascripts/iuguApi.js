function iuguApi() {
  if ($('.payment-form').length) {
    Iugu.setAccountID("DE2188CC0F5540EEB8AFD1A150DB3CFF");
    Iugu.setTestMode(true);
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
      } else {
        $("#token").val(data.id);
        form.get(0).submit();
      }
    }
    Iugu.createPaymentToken(this, tokenResponseHandler);
    return false;
  });
}
