$(document).on('turbolinks:load', function() {
  var lastFixPos = 0;
  var threshold = 100;
  document.onscroll = function() {myScroll()};

  function myScroll(){
    var diff = $(window).scrollTop() - lastFixPos;
    if (diff > threshold){
      lastFixPos = $(window).scrollTop();
      document.getElementById('nav-bar').classList.remove('show-nav');
      document.getElementById('nav-bar').classList.add('hide-nav');
    }else if (diff < -threshold){
      lastFixPos = $(window).scrollTop();
      document.getElementById('nav-bar').classList.remove('hide-nav');
      document.getElementById('nav-bar').classList.add('show-nav');

    }
  }

  function lightbox(){
    document.getElementById("lightbox").classList.remove('hidden')
  }
});

