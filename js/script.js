function getLocalStorage(key){
    var store = localStorage.getItem(key);
    if(store){
      return JSON.parse(store)
    }
    return null
  }
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
    window.uploaded = 'http://47.75.35.19/public/'

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
        // 重新支付
        retryPay(data){
            return new Promise((resolve, reject) => {
                $.ajax({
                    url: window.api_host + '/api/paypal/pay',
                    method: "POST",
                    data: data,
                    dataType: 'json',
                    success(res){
                        resolve(res)
                    },
                    error(xhr, error){
                        reject(xhr, error)
                    }
                })
            })
        },
        // 获取评论列表
        getCommentList(data){
            return new Promise((resolve, reject) => {
                $.ajax({
                    url: window.api_host + '/api/news_comment/index',
                    method: "POST",
                    data: data,
                    dataType: 'json',
                    success(res){
                        resolve(res)
                    },
                    error(xhr, error){
                        reject(xhr, error)
                    }
                })
            })
        },
        // 提交评论
        commentSubmit(data){
            return new Promise((resolve, reject) => {
                $.ajax({
                    url: window.api_host + '/api/news_comment/add',
                    method: "POST",
                    data: data,
                    dataType: 'json',
                    success(res){
                        resolve(res)
                    },
                    error(xhr, error){
                        reject(xhr, error)
                    }
                })
            })
        },
         //更改预约
         order_mod( data ){
            return new Promise((resolve, reject) => {
                $.ajax({
                    url: window.api_host + '/api/order/modify',
                    method: 'POST',
                    data: data,
                    dataType: 'json',
                    success(res){
                        resolve(res)
                    },
                    error(xhr, error){
                        reject(xhr, error)
                    }
                })
            })
        },
        //查看折扣券
        getCouponCode( data ){
            return new Promise((resolve, reject) => {
                $.ajax({
                    url: window.api_host + '/api/coupon/get',
                    method: 'POST',
                    data: data,
                    dataType: 'json',
                    success(res){
                        resolve(res)
                    },
                    error(xhr, error){
                        reject(xhr, error)
                    }
                })
            })
        },
        // 预订详情
        booking_detail(data){
            return new Promise((resolve, reject) => {
                $.ajax({
                    url: window.api_host + '/api/order/get',
                    method: 'POST',
                    data: data,
                    dataType: 'json',
                    success(res){
                        resolve(res)
                    },
                    error(xhr, error){
                        reject(xhr, error)
                    }
                })
            })
        },
        //展览馆缩略图
        zone_preview(language){
            return new Promise((resolve, reject) => {
                $.ajax({
                    url: window.api_host + '/api/help/zone',
                    method: 'POST',
                    data: language,
                    dataType: 'json',
                    success(res){
                        resolve(res)
                    },
                    error(xhr, error){
                        reject(xhr, error)
                    }
                })
            })
        },
        // 预订日程
        booking_add( data ){
            return new Promise((resolve, reject) => {
                $.ajax({
                    url: window.api_host + '/api/order/add',
                    method: 'POST',
                    data: data,
                    dataType: 'json',
                    success(res){
                        resolve(res)
                    },
                    error(xhr, error){
                        reject(xhr, error)
                    }
                })
            })
        },
        getZone(data){
            return new Promise((resolve, reject) => {
                $.ajax({
                    url: window.api_host + '/api/help/zone',
                    method: 'POST',
                    data: data,
                    dataType:'json',
                    success(res){
                       resolve(res)
                    },
                    error(xhr,error){
                        reject(xhr,error)
                    }
                })
            })
        },
        //预约首页
        getBookingIndex(data){
            return new Promise((resolve, reject) => {
                $.ajax({
                    url: window.api_host + '/api/help/index',
                    method: 'POST',
                    data: data,
                    dataType:'json',
                    success(res){
                       resolve(res)
                    },
                    error(xhr,error){
                        reject(xhr,error)
                    }
                })
            })
        },
        // 获取日程列表
        schedule_date(data){
            return new Promise((resolve, reject) => {
                $.ajax({
                    url: window.api_host + '/api/schedule/index',
                    method: 'POST',
                    data: data,
                    dataType:'json',
                    success(res){
                       resolve(res)
                    },
                    error(xhr,error){
                        reject(xhr,error)
                    }
                })
            })
        },
        // 低碳百货，全新造型
        fittingmirror: {
            user_score(header){
                return new Promise((resolve, reject) => {
                    $.ajax({
                        url: window.api_origin + '/fittingmirror/user_score',
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

        // 低碳百货，新鲜食品与日常用品
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

Date.prototype.Format = function(fmt)   
    { //author: meizz   
        var o = {   
            "M+" : this.getMonth()+1,                 //月份   
            "d+" : this.getDate(),                    //日   
            "h+" : this.getHours(),                   //小时   
            "m+" : this.getMinutes(),                 //分   
            "s+" : this.getSeconds(),                 //秒   
            "q+" : Math.floor((this.getMonth()+3)/3), //季度   
            "S"  : this.getMilliseconds()             //毫秒   
        };   
        if(/(y+)/.test(fmt))   
            fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));   
        for(var k in o)   
            if(new RegExp("("+ k +")").test(fmt))   
        fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
        return fmt;   
    } ;




// 增加语言包的支持
;(function($){
    var i18nLanguage = getLocalStorage('hk_language');
    if(i18nLanguage){
        i18nLanguage = i18nLanguage.lan
    } else {    
        i18nLanguage = 'CHT'
    }

    var i18nSourcePath = '';
    var develoment = false;
    if( develoment ){
        i18nSourcePath = '/HK/hkbu_cms/hkbu_cms_booking/js/i18n/' + i18nLanguage + '.json'
    } else {
        i18nSourcePath = '/js/i18n/' + i18nLanguage + '.json'
    }
    $.getJSON(i18nSourcePath, function(res){
        window.lang = res;
        $("a.nav1").attr('data-i18n-text', 'navigations.biology')
        $("a.nav2").attr('data-i18n-text', 'navigations.hall')
        $("a.nav3").attr('data-i18n-text', 'navigations.zhuanjia')
        $("a.nav4").attr('data-i18n-text', 'navigations.news')
        $("a.nav5").attr('data-i18n-text', 'navigations.member')
        $("a.nav6").attr('data-i18n-text', 'navigations.concat')
        $("span.nav7").attr('data-i18n-text', 'navigations.booking')


        $('[data-i18n-text]').each(function () {
            //如果text里面还有html需要过滤掉
            var html = $(this).html();
            var reg = /<(.*)>/;

            var arrkey = $(this).data('i18n-text').split('.');
            var key = 'res';

            arrkey.forEach( item => {
                key += '["'+item+'"]'
            })

            if (reg.test(html)) {
                var htmlValue = reg.exec(html)[0];
                $(this).html(htmlValue + eval(key));
            }
            else {
                $(this).html(eval(key));
            }
        });

        $('[data-i18n-placeholder]').each(function () {
            var arrkey = $(this).data('i18n-placeholder').split('.');
            var key = 'res';

            arrkey.forEach( item => {
                key += '["'+item+'"]'
            })

            $(this).attr('placeholder', eval(key));
        });


        
        $.get('page_footer.html', function( footerHtml ){
            $(".footer_wrap").html(footerHtml)

            $(".lang_about_link li").each((index, item) => {
                $(item).find('a').text(res.footer_copyright.links[index].text)
            })
            $(".lang_footer_addr_label").text(res.footer_copyright.addr.label)
            $(".lang_footer_addr_value").text(res.footer_copyright.addr.value)

            $(".lang_footer_opentime_label").text(res.footer_copyright.opentime.label)
            $(".lang_footer_opentime_value").text(res.footer_copyright.opentime.value)

            $(".lang_footer_phone_label").text(res.footer_copyright.phone.label)
            $(".lang_footer_phone_value").text(res.footer_copyright.phone.value)

            $(".lang_footer_email_label").text(res.footer_copyright.email.label)
            $(".lang_footer_email_value").text(res.footer_copyright.email.value)
            $(".lang_footer_copyright").text(res.footer_copyright.copyright)
            $(".lang_about_me").text(res.footer_copyright.about_me)
            $('.lang_concat_title').text(res.concat.title)
            $('.lang_concat_sub_title').text(res.concat.sub_title)
        })
        
    })
   
})(jQuery)