function iuguApi() {
  if ($('.payment-form').length) {
    Iugu.setAccountID("DE2188CC0F5540EEB8AFD1A150DB3CFF");
    Iugu.setTestMode(true);
    Iugu.setup();
  }
  $('#payment-form').submit(function(event) {
    var form = $(this);
    var tokenResponseHandler = function(data) {
      if (data.errors) {
        console.log("Erro salvando cartão: " + JSON.stringify(data.errors));
      } else {
        $("#token").val(data.id);
        form.get(0).submit();
      }
    }
    Iugu.createPaymentToken(this, tokenResponseHandler);
    return false;
  });
}
