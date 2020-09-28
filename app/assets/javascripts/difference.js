$(function() {
  $('.payment_amount, .amount_paid').change(function(){

    var payment_amount = $('.payment_amount').val();
    var amount_paid = $('.amount_paid').val();
    var difference = amount_paid - payment_amount;

    $("#difference").html("<p>差額 :</p>" + "<p class = 'num'> ¥ </p>" + "<p class = 'num'>" + difference + "</p>");

    // if (difference == 0){
    //   $("#difference").fadeOut();
    // } else if (difference > 0) {
    //   $("#difference").fadeIn();
    // };

    $('#order[difference]').val(difference)

  });
});