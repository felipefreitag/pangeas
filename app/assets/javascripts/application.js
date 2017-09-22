// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require rails-ujs
//= require turbolinks
//= require toastr
//= require owl.carousel
//= require_tree .

$(function(){
  document.addEventListener("turbolinks:load", function(event) {
    ga('set', 'location', event.data.url);
    ga('send', 'pageview');
    $(document).foundation();
  });
});

$(function(){ $(document).foundation(); });

$(function(){
  $(".owl-carousel").owlCarousel({
    nav: true,
    navText: ['<i class="fa fa-caret-left fa-2x" aria-hidden="true"></i>',
      '<i class="fa fa-caret-right fa-2x" aria-hidden="true"></i>'],
    loop: true,
    margin: 15,
    responsiveClass: true,
    responsive: {
      0: { items: 1 },
      400: { items: 2 },
      600: { items: 3 },
    }
  });
});
