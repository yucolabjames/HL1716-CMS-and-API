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

  var timer = setInterval(function(){
    if(lang){
      init(lang)
    } 
  }, 300)  
    function init(langPack){
        clearInterval(timer)
        var lang = getLocalStorage('hk_language');
        var language, lan_id;
        if(lang){
            language = lang.lan;
            lan_id = lang.lan_id;
        } else {
            language = 'CHT';
            lan_id = 3;
        }
        new Vue({
            el: '#vue_app',
            data: {
                lang: langPack,
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
      
                    getToken().then( res => { 
                        valid = true; config = res; 
                        this.config = config;
                        this.getVirtualHabitat();
                        api.me.me({lang: 'zh', auth: config.token}).then( res => {
                            console.log( res )
                        })
                    })
      
                },
                // 获取消失的物种
                getVirtualHabitat(){
                    api.collecting.user_animals({lang: language, auth: this.config.token}).then( res => {
                          setTimeout(() => {
                              $(".section-profileCon").backstretch({
                                  alignY: 0,
                                  url: 'images/profile/profileBg_star.jpg',
                                  //alignX: 0,
                                  //url:"images/profile/profileBg.jpg".
                              });
                      
                              this.renderCharts(res.length);
                              $(".widget-option li.active a").parents(".dropdown").find('dLabel').val($(this).data('value'));
                          }, 100)
                        this.Habitats = res;
                        this.Habitats_types = _.uniq(res.map( item => item.habitat_chinese_name ))
                        this.Habitats_types = this.Habitats_types.map( (item, index) => {
                            return {
                                label: item,
                                tag : 'tag'+(++index)
                            }
                        })
                        
                        this.Habitats_types.forEach( item => {
                            this.Habitats.forEach(val => {
                                if(item.label == val.habitat_chinese_name){
                                    val.tag = item.tag
                                }
                            })
                        })
                        
                        
                        
                    }).catch( (xhr, err) => {
                        if(xhr.status == 401){
                            location.href = 'memberLogin.html?lang='+language
                        }
                    })
                },
      
                renderCharts(pencentage){
                  var donutEl = document.getElementById("donut").getContext("2d");
                  var donut = new Chart(donutEl).Doughnut(
                    // Datas
                    [
                      {
                        value: pencentage,
                        color:"#00bf91",
                        highlight: "#00bf91",
                        label: "ocean"
                      },
                      {
                        value: 9-pencentage,
                        color: "#90bece",
                        highlight: "#90bece",
                        label: "Wetland"
                      }
                    ],
                    // Options
                    {
                      segmentShowStroke : false,
                      percentageInnerCutout : 90,
                      animationSteps : 100,
                      animationEasing : "easeOutBounce",
                      animateRotate : true,
                      animateScale : false,
                      responsive: true,
                      maintainAspectRatio: true,
                      showScale: true,
                      animateScale: true
                    });
                }
            }
        })
    }
});


