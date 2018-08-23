$(function() {
    // INSERT YOUR JAVASCRIPT HERE
   $(window).bind('load resize', function() {

     
   
  });

  
  var language = getQueryString('lan') || 'CHT';
  new Vue({
    el: '#vue_app',
    data: {
      lang: lang[language],
      user: {},
      Habitats:[],
      Habitats2: [],
      config: {}
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
          this.getVirtualHabitat2();
        })

        $(".bottom-part a").each((index, item) => {
          var href = $(item).prop('href')
          href = href + `?lan=${language}`
          $(item).prop('href', href)
        })
      },
      getVirtualHabitat(){
        api.virtual.user_animals({lang: this.language, auth: this.config.token}).then( res => {
            this.Habitats = res;
        }).catch( (xhr, err) => {
            if(xhr.status == 401){
                location.href = 'memberLogin.html?lang='+language
            }
        })
      },
      getVirtualHabitat2(){
 
        api.collecting.user_animals({lang: language, auth: this.config.token}).then( res => {
            this.Habitats2 = res;
        }).catch( (xhr, err) => {
            if(xhr.status == 401){
                location.href = 'memberLogin.html?lang='+language
            }
        })
      },
    }
  })

     
});


