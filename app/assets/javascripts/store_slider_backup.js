$(document).ready(function() {
  var slideNumber = 0,
      $store = $('.stores');

  function slide() {
    $store.animate( { marginLeft: '-=100%' }, 'slow', popPush);
  }

  function popPush() {
    var slide = $store.find('li.store-pic:first');
    var slideClone = slide.clone();

    slideClone.appendTo($store);
    slide.remove();
    $store.css('margin-left', 0);
  }

  setInterval( function() {
    slide()
  }, 2000 )

});