$(document).ready(function() {
  var $box1 = $('#player1_strip .active');
  var $box2 = $('#player2_strip .active');

  $(document).keyup(function(e) {
    if (e.keyCode == 37) {
      $box1 = $box1.next();
      $box1.addClass('active');
      $box1.prev().removeClass('active');
    }
    if ($box1.attr('id') == "10") {
      alert('A is the winner!');
    }
  });
  $(document).keyup(function(e) {
    if (e.keyCode == 39) {
      $box2 = $box2.next();
      $box2.addClass('active');
      $box2.prev().removeClass('active');
    }
    if ($box2.attr('id') == "10") {
      alert('B is the winner!');
    }
  });

});
