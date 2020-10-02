$(function(){
  $('.overflow-tooltip').bind('mouseover', function(){
    var $this = $(this);
    if (this.offsetWidth < this.scrollWidth && !$this.attr('title')){
      $this.attr('title', $this.text());
    }
  });
});