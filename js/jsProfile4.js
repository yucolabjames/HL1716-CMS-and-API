$(function() {
  // INSERT YOUR JAVASCRIPT HERE
 $(window).bind('load resize', loadResize);

  function loadResize(){

      $(".section-profileCon").backstretch({
              alignY: 0,
                  url: 'images/profile/profileBg_star.jpg',
              //alignX: 0,
              //url:"images/profile/profileBg.jpg".
      });


      $(".widget-option li.active a").parents(".dropdown").find('dLabel').val($(this).data('value'));

  }
  

  function fancebox(){
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
  }

  var language = getQueryString('lan') || 'CHT';
  new Vue({
      el: '#vue_app',
      data: {
          lang: lang[language],
          language,
          user: {},
          Habitats: [],
          Habitats_types: []
      },
      mounted(){
      this.init();
      this.user = JSON.parse(sessionStorage.getItem('login'))
      },
      methods: {

          init(){
              $('.animsition').animsition({
              inDuration: 500,
              });
              
              var valid = false;
              var config;

              
              $(".widget-submenu  a").each((index, item) => {
                var href = $(item).prop('href')
                href = href + `?lan=${language}`
                $(item).prop('href', href)
            })
          },
          
      }
  })
});


