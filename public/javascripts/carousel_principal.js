jQuery(document).ready(function () {

	//jCarousel Plugin
	jQuery('#carousel').jcarousel({
		scroll: 1,
		auto: 2,
		wrap: 'last',
		initCallback: mycarousel_initCallback
	});

	//Front page Carousel - Initial Setup
	jQuery('div#slideshow-carousel a img').css({'opacity': '0.5'});
	jQuery('div#slideshow-carousel a img:first').css({'opacity': '1.0'});
	jQuery('div#slideshow-carousel li a:first').append('<span class="arrow"></span>')


	//Combine jCarousel with Image Display
	jQuery('div#slideshow-carousel li a').hover(
		function () {
			if (!jQuery(this).has('span').length) {
				jQuery('div#slideshow-carousel li a img').stop(true, true).css({'opacity': '0.5'});
				jQuery(this).stop(true, true).children('img').css({'opacity': '1.0'});
			}		
		},
		function () {
			jQuery('div#slideshow-carousel li a img').stop(true, true).css({'opacity': '0.5'});
			jQuery('div#slideshow-carousel li a').each(function () {
				if (jQuery(this).has('span').length) jQuery(this).children('img').css({'opacity': '1.0'});
			});

		}
	).click(function () {

		jQuery('span.arrow').remove();        
		jQuery(this).append('<span class="arrow"></span>');
		jQuery('div#slideshow-main li').removeClass('active');        
		jQuery('div#slideshow-main li.' + jQuery(this).attr('rel')).addClass('active');	

		return false;
	});

});