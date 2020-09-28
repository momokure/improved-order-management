$(function(){
    $(document).on('change', '.payment_amount, .amount_paid', function(){

    var payment_amount = $('.payment_amount').val();
    var amount_paid = 0;
    $(".amount_paid").each(function () {
      var get_amount_paid_value = $(this).val();
      amount_paid += parseFloat(get_amount_paid_value);
    });

    var difference = amount_paid - payment_amount;

    $("#difference").html("<p>差額 :</p>" + "<p class = 'num'> ¥ </p>" + "<p class = 'num'>" + difference + "</p>");

    if (difference == 0) {
      $("#difference").fadeOut();

    } else if (difference > 0) {
      $("#difference").css('color', 'royalblue').fadeIn();
    } else if (difference < 0) {
      $("#difference").css('color', 'orangered').fadeIn();
    }

    $('input:hidden[name="order[difference]"]').val(difference);
  });
});