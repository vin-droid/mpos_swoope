 /**
 * This demo was prepared for you by Petr Tichy - Ihatetomatoes.net
 * Want to see more similar demos and tutorials?
 * Help by spreading the word about Ihatetomatoes blog.
 * Facebook - https://www.facebook.com/ihatetomatoesblog
 * Twitter - https://twitter.com/ihatetomatoes
 * Google+ - https://plus.google.com/u/0/109859280204979591787/about
 * Article URL: http://ihatetomatoes.net/simple-parallax-scrolling-tutorial/
 */
$(document).ready(function(){
  ( function( $ ) {
	
	// Setup variables
	$window = $(window);
	$slide = $('.homeSlide');
	$body = $('body');
	
    //FadeIn all sections   
	$body.imagesLoaded( function() {
		setTimeout(function() {
		      
		      // Resize sections
		      adjustWindow();
		      
		      // Fade in sections
			  $body.removeClass('loading').addClass('loaded');
			  
		}, 800);
	});
	
	function adjustWindow(){
		
		// Init Skrollr
		$(document).on('page:load', function () {
			skrollr.init().refresh('.homeSlide'); 
		});
		
		// Get window size
	    winH = $window.height();
	    
	 //    // Keep minimum height 550
	 //    if(winH <= 650) {
		// 	winH = 650;
		// } 
	    
	 //    // Resize our slides
	 //    $slide.height(winH);
	    
	 //    // Refresh Skrollr after resizing our sections
	 //    s.refresh($('.homeSlide'));
	    
	}
		
} )( jQuery );
});