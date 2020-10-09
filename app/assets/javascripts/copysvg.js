jQuery(function($){
    $('.copy-outer').on('click', function() {
        var target = $(this).data('target');
        var text = $(target).prop('outerHTML');
        $(this).copy(text);
        // alert('指示書SVGをコピーしました。');
        $('#target_msg_box').show(0, function () {
        //コールバックで2秒後にフェードアウト
        $(this).delay(1000).fadeOut("slow");
      });
    });
    $.fn.extend({
        copy: function(text) {
            $(this).after('<textarea>'+text+'</textarea>');
            $(this).next('textarea').select();
            document.execCommand('copy');
            $(this).next('textarea').remove();
        },
    });
});
