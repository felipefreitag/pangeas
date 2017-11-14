/*
*  Inspired by https://css-tricks.com/text-fade-read-more/
*/
function showMore() {
	$(".video-info .link-container a").click(function() {
    $moreContainer = $('.more-container');
		$moreContainer
			.css({
				// Set height to prevent instant jumpdown when max height is removed
				"height": $moreContainer.height(),
				"max-height": 9999
			})
			.animate({
				"height": $moreContainer.children(':first').outerHeight()
			});
		// fade out read-more
		$('.link-container').fadeOut();
		// prevent jump-down
		return false;
	});
}
