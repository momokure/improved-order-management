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
            `<li class="customer"><a href="/customers/${customer.uid}">${customer.customer_name} 様のご注文一覧</a>
             <class="customer_button"><a href="/orders/new?customer_id=${customer.uid}">(あたらしいご注文を登録)</a>`
        );
      });
    })
  });
})