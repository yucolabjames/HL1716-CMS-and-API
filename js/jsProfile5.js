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
          Habitats_types: [],
          foods: [],
          products: [],
          fittingmirror:{}
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
                
                this.language =   language == 'CHT' ? 'ZH':
                             language == 'CHS' ? 'CN': 
                             language == 'ENG' ? 'EN': 'zh'

                getToken().then( res => { 
                    valid = true; config = res; 
                    this.config = config;
                    this.getVirtualHabitat();
                    this.getFittingmirror();
                    api.me.me({lang: language, auth: config.token}).then( res => {
                        console.log( res )
                    })
                })

                $(".widget-submenu  a").each((index, item) => {
                    var href = $(item).prop('href')
                    href = href + `?lan=${language}`
                    $(item).prop('href', href)
                })

          },
          getFittingmirror(){
            api.fittingmirror.user_score({lang: this.language, auth: this.config.token}).then( res => {
                this.fittingmirror = res;
            })
          },
          // 获取新鲜食品与日常用品
          getVirtualHabitat(){
            api.shopping_game.user_bought_list({lang: this.language, auth: this.config.token}).then( res => {
                // filters
                this.foods = res.filter(item => item.category == 'food')
                
                this.products = res.filter(item => item.category == 'product')


                this.Habitats = res;
                setTimeout(() => {
                    $(".section-profileCon").backstretch({
                        alignY: 0,
                        url: 'images/profile/profileBg_star.jpg',
                    });
                    $('.slider-shop').slick({
                        slidesToShow: 5,
                        slidesToScroll: 1,
                        dots:false,
                        responsive: [
                            {
                                breakpoint: 1024,
                                settings: {
                                    slidesToShow: 4,
                                    slidesToScroll: 1,
                                }
                            },
                            {
                                breakpoint: 600,
                                settings: {
                                    slidesToShow: 2,
                                    slidesToScroll: 1
                                }
                            }
                        ]
                  
                    });
                }, 100)

            }).catch( (xhr, err) => {
                if(xhr.status == 401){
                    location.href = 'memberLogin.html?lang='+language
                }
            })
          },

          
      }
  })
});


