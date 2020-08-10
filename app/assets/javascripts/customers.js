$(function () {
  $('.js-text_field').on('keyup', function () {
    var customer_name = $.trim($(this).val());
    $.ajax({
      type: 'GET',
      url: '/customers/searches',
      data: ("customer_name=" + customer_name),
      dataType: 'json'
    })
      .done(function (data) {
        $('.js-customers li').remove();
        $(data).each(function(i,customer) {
          $('.js-customers').append(
            `<li class="customer"><a href="/customers/${customer.id}">${customer.customer_name}</a></li>`
        );
      });
    })
  });
});