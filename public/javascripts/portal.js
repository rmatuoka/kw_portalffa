
var submenuoff = true;

jQuery(document).ready(function() {
    var pageHeight;
	jQuery(window).resize(function(){calculateLightboxwidth()});
	
    calculateLightboxHeight();
    calculateLightboxwidth();
    function calculateLightboxHeight() {
        pageHeight = jQuery(document).height()+"px";
        jQuery('.Shadow').height(pageHeight);
    }
    function calculateLightboxwidth() {
		if(jQuery(window).width()>768) {
			submenuoff = true;
		}
		else{
			submenuoff = false;			
			}
    }	
	
	(function() {

	         var navlinks = jQuery('#Menu li:lt(4) a');
	         var openDropdown = false;
	         navlinks.mouseenter(
	             function(e){
	                 if(submenuoff) {	                 				 
							 if(!openDropdown) {
									 jQuery('.Shadow').addClass('ShadowShow');	                  
									 openDropdown = true;
							 }
						}	
	             }
	         );
			
			function removeShadow(){
				jQuery('.Shadow').removeClass('ShadowShow');
				if(openDropdown) {
					 openDropdown = false;
				}
			};				
	         jQuery('#Menu').mouseleave(
	            function(e){
					removeShadow();
	            }
	         );
	      	jQuery('.Shadow_off').mouseenter(
				function(e){
					removeShadow();
				}
	         );			 


	})();
 });
/*  efeito menu light box*/ 
 
 
/*  efeito logos  branco e preto*/
jQuery(function() {
    jQuery("img.Swap")
        .mouseover(function() { 
            var src = jQuery(this).attr("src").replace("pb/", "original/");
            jQuery(this).attr("src", src);
        })
        .mouseout(function() {
            var src = jQuery(this).attr("src").replace("original/", "pb/");
            jQuery(this).attr("src", src);
        });
});
/*  efeito logos  branco e preto*/



//Carousel Tweaking

function mycarousel_initCallback(carousel) {
	
	// Pause autoscrolling if the user moves with the cursor over the clip.
	carousel.clip.hover(function() {
		carousel.stopAuto();
	}, function() {
		carousel.startAuto();
	});
}
