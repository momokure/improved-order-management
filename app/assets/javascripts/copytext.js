$(function() {
  $('.copybtn').on('click', function(){
    var textElem = $(this).parent().find('#copytext');
    window.getSelection().selectAllChildren(textElem[0]);
    document.execCommand("copy");
  });
});
