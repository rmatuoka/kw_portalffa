
var submenuoff = true;

$(document).ready(function() {
    var pageHeight;
	$(window).resize(function(){calculateLightboxwidth()});
	
    calculateLightboxHeight();
    calculateLightboxwidth();
    function calculateLightboxHeight() {
        pageHeight = $(document).height()+"px";
        $('.Shadow').height(pageHeight);
    }
    function calculateLightboxwidth() {
		if($(window).width()>768) {
			submenuoff = true;
		}
		else{
			submenuoff = false;			
			}
    }	
	
	(function() {

	         var navlinks = $('#Menu li:lt(4) a');
	         var openDropdown = false;
	         navlinks.mouseenter(
	             function(e){
	                 if(submenuoff) {	                 				 
							 if(!openDropdown) {
									 $('.Shadow').addClass('ShadowShow');	                  
									 openDropdown = true;
							 }
						}	
	             }
	         );
			
			function removeShadow(){
				$('.Shadow').removeClass('ShadowShow');
				if(openDropdown) {
					 openDropdown = false;
				}
			};				
	         $('#Menu').mouseleave(
	            function(e){
					removeShadow();
	            }
	         );
	      	$('.Shadow_off').mouseenter(
				function(e){
					removeShadow();
				}
	         );			 


	})();
 });
/*  efeito menu light box*/ 
 
 
/*  efeito logos  branco e preto*/
$(function() {
    $("img.Swap")
        .mouseover(function() { 
            var src = $(this).attr("src").match(/[^\.]+/) + "_color.jpg";
            $(this).attr("src", src);
        })
        .mouseout(function() {
            var src = $(this).attr("src").replace("_color", "");
            $(this).attr("src", src);
        });
});
/*  efeito logos  branco e preto*/
