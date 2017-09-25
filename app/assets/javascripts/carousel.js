function startCarousel() {
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
}
