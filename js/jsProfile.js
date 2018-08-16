$(function() {
    // INSERT YOUR JAVASCRIPT HERE
   $(window).bind('load resize', function() {

       $(".section-profileCon").backstretch({
       		alignY: 0,
       	 	url: 'images/profile/profileBg_star.jpg',
       		//alignX: 0,
       		//url:"images/profile/profileBg.jpg".
       });


           $(".widget-option li.active a").parents(".dropdown").find('dLabel').val($(this).data('value'));
   
  	});

    $("[data-fancybox]").fancybox({
      toolbar: false,
      btnTpl: {
       
        // Arrows
        arrowLeft:
            '<a data-fancybox-prev class="hide fancybox-button fancybox-button--arrow_left" title="{{PREV}}" href="javascript:;">' +
            '<svg viewBox="0 0 40 40">' +
            '<path d="M18,12 L10,20 L18,28 M10,20 L30,20"></path>' +
            "</svg>" +
            "</a>",

        arrowRight:
            '<a data-fancybox-next class="hide fancybox-button fancybox-button--arrow_right" title="{{NEXT}}" href="javascript:;">' +
            '<svg viewBox="0 0 40 40">' +
            '<path d="M10,20 L30,20 M22,12 L30,20 L22,28"></path>' +
            "</svg>" +
            "</a>"
    },
    });

     
});


