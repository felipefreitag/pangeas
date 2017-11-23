function startCarousel() {
  $(".carousel-three-items").owlCarousel({
    nav: true,
    navText: ['<i class="fa fa-caret-left fa-2x" aria-hidden="true"></i>',
      '<i class="fa fa-caret-right fa-2x" aria-hidden="true"></i>'],
    loop: true,
    margin: 15,
    responsiveClass: true,
    dots: false,
    responsive: {
      0: { items: 1 },
      400: { items: 2 },
      600: { items: 3 }
    }
  });

  $(".carousel-four-items").owlCarousel({
    nav: true,
    navText: ['<i class="fa fa-caret-left fa-2x" aria-hidden="true"></i>',
      '<i class="fa fa-caret-right fa-2x" aria-hidden="true"></i>'],
    loop: true,
    margin: 15,
    responsiveClass: true,
    dots: false,
    responsive: {
      0: { items: 1 },
      400: { items: 2 },
      600: { items: 3 },
      1000: { items: 4 }
    }
  });
}
