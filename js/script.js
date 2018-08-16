$(function() {
    // INSERT YOUR JAVASCRIPT HERE
    $('.animsition').animsition({
      inDuration: 500,
    });

  
     //svg turn to xml
    jQuery('img.svg').each(function() {
         var jQueryimg = jQuery(this);
         var imgID = jQueryimg.attr('id');
         var imgClass = jQueryimg.attr('class');
         var imgURL = jQueryimg.attr('src');
        jQuery.get(imgURL, function(data) {
                   // Get the SVG tag, ignore the rest
                   var jQuerysvg = jQuery(data).find('svg');
      // Add replaced image's ID to the new SVG
                   if (typeof imgID !== 'undefined') {
                       jQuerysvg = jQuerysvg.attr('id', imgID);
                   }
                   // Add replaced image's classes to the new SVG
                   if (typeof imgClass !== 'undefined') {
                       jQuerysvg = jQuerysvg.attr('class', imgClass + ' replaced-svg');
                   }
      // Remove any invalid XML tags as per http://validator.w3.org
                   jQuerysvg = jQuerysvg.removeAttr('xmlns:a');
      // Replace image with new SVG
                   jQueryimg.replaceWith(jQuerysvg);
        }, 'xml');
      });

    

    function onScrollInit(items, trigger) {
        items.each(function() {
            var osElement = $(this),
                osAnimationClass = osElement.attr('data-os-animation'),
                osAnimationDelay = osElement.attr('data-os-animation-delay');

            osElement.css({
                '-webkit-animation-delay': osAnimationDelay,
                '-moz-animation-delay': osAnimationDelay,
                'animation-delay': osAnimationDelay
            });

            var osTrigger = (trigger) ? trigger : osElement;


            osTrigger.waypoint(function() {
                osElement.addClass('animated').addClass(osAnimationClass);
            }, {
                triggerOnce: true,
                offset: '60%'
            });
        });
    }

    onScrollInit($('.os-animation'));
    onScrollInit($('.staggered-animation'), $('.staggered-animation-container'));


     
});

//Traffic analysis
var _paq = _paq || [];
/* tracker methods like "setCustomDimension" should be called before "trackPageView" */
_paq.push(['trackPageView']);
_paq.push(['enableLinkTracking']);
(function() {
var u="//sgallery.hkbu.edu.hk/traffic/";
_paq.push(['setTrackerUrl', u+'piwik.php']);
_paq.push(['setSiteId', '1']);
var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
g.type='text/javascript'; g.async=true; g.defer=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
})();

(()=>{
    function getQueryString(name){
        var reg = new RegExp('(^|&)' + name + '=([^&]*)(&|$)', 'i');
        var r = window.location.search.substr(1).match(reg);
        if (r != null) {
            return unescape(r[2]);
        }
        return null;
    }

    window.getQueryString = getQueryString
})();
// API config
(function($, win){
    // window.api_host = 'http://192.168.0.146/yucolab.cq.com'
    // window.uploaded = 'http://192.168.0.146/yucolab.cq.com/public/'

    window.api_host = 'http://54.223.82.58:5052'
    window.uploaded = 'http://54.223.82.58:5052/'

    
})(jQuery, window)