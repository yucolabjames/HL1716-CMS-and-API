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

    window.api_host = 'http://cqyuanyu:Cq12345@47.75.35.19'
    window.uploaded = 'http://cqyuanyu:Cq12345@47.75.35.19/public/'

    window.api_origin = 'https://www.hl1716.yucolab.com/buhk_sgallery/api'
    var data = {
        "platform": "pc",
        "device_id": "ABCD1234EFGH5678",
        "version": "1.0.0"
      }
    // $.post(window.api_origin + '/init', JSON.stringify(data), res => {
    //     console.log(res)
    //   }, 'json')

    var config;

    function getToken(){
        return new Promise((resolve, reject) => {
            if(sessionStorage.getItem('user_token') == null){
                
                $.ajax({
                    url: window.api_origin + '/init',
                    method: 'POST',
                    headers: {
                        'Content-Type': "application/json"
                    },
                    data: JSON.stringify(data),
                    dataType:'json',
                    success(res){
                       sessionStorage.setItem('user_token', JSON.stringify(res))
                       resolve(res)
                    }
                })
            } else {
                config = sessionStorage.getItem('user_token')
                resolve(JSON.parse(config))
            }
        })
    }

    var api = {
        shopping_game: {
            user_bought_list(header){
                return new Promise((resolve, reject) => {
                    $.ajax({
                        url: window.api_origin + '/shoppinggame/user_bought_list',
                        method: 'GET',
                        headers: {
                            'Accept-Language': header.lang || 'zh',
                            'Content-Type': "application/json",
                            'Authorization': header.auth
                        },
                        dataType:'json',
                        success(res){
                           resolve(res)
                        },
                        error(xhr,error){
                            reject(xhr,error)
                        }
                    })
                })
            }
        },
        virtual: {
            user_animals(header){
                return new Promise((resolve, reject) => {
                    $.ajax({
                        url: window.api_origin + '/habitat/user_animals',
                        method: 'GET',
                        headers: {
                            'Accept-Language': header.lang || 'zh',
                            'Content-Type': "application/json",
                            'Authorization': header.auth
                        },
                        dataType:'json',
                        success(res){
                           resolve(res)
                        },
                        error(xhr,error){
                            reject(xhr,error)
                        }
                    })
                })
            }
        },
        collecting: {
            user_animals(header){
                return new Promise((resolve, reject) => {
                    $.ajax({
                        url: window.api_origin + '/rescue/user_animals',
                        method: 'GET',
                        headers: {
                            'Accept-Language': header.lang || 'zh',
                            'Content-Type': "application/json",
                            'Authorization': header.auth
                        },
                        dataType:'json',
                        success(res){
                           resolve(res)
                        },
                        error(xhr,error){
                            reject(xhr,error)
                        }
                    })
                })
            }
        },
        me: {
            me(header, body){
                return new Promise( (resolve, reject) => {
                    $.ajax({
                        url: window.api_origin + '/me',
                        method: 'GET',
                        headers: {
                            'Accept-Language': header.lang || 'zh',
                            'Content-Type': "application/json",
                            'Authorization': header.auth
                        },
                        dataType:'json',
                        success(res){
                           resolve(res)
                        },
                        error(error){
                            reject(error)
                        }
                    })
                })
            }
        },
        auth: {
            login(header, body){
                return new Promise( (resolve, reject) => {
                    $.ajax({
                        url: window.api_origin + '/auth/login',
                        method: 'POST',
                        headers: {
                            'Accept-Language': header.lang || 'zh',
                            'Content-Type': "application/json",
                            'Authorization': header.auth
                        },
                        data: JSON.stringify(body),
                        dataType:'json',
                        success(res){
                           resolve(res)
                        },
                        error(error){
                            reject(error)
                        }
                    })
                })
            },
            forgot_password(header, body){
                return new Promise( (resolve, reject) => {
                    $.ajax({
                        url: window.api_origin + '/auth/forgot_password',
                        method: 'POST',
                        headers: {
                            'Accept-Language': header.lang || 'zh',
                            'Content-Type': "application/json",
                            'Authorization': header.auth
                        },
                        data: JSON.stringify(body),
                        dataType:'json',
                        success(res){
                           resolve(res)
                        },
                        error(error){
                            reject(error)
                        }
                    })
                })
            },
            
        }
    }
    
    window.getToken = getToken;
    window.api = api;

})(jQuery, window)