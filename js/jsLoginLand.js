$(function() {
    // INSERT YOUR JAVASCRIPT HERE
   $(window).bind('load resize', function() {
    console.log('b')
    
   
  });

 
  $('.animsition').animsition({
    inDuration: 500,
  })
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
          
          
          var valid = false;
          var config;

          getToken().then( res => { 
            valid = true; config = res; 
            this.config = config;
            
            this.getVirtualHabitat();
            this.getVirtualHabitat2();
          })

        },
        getVirtualHabitat(){
          api.virtual.user_animals({lang: this.language, auth: this.config.token}).then( res => {
              this.Habitats = res;
          }).catch( (xhr, err) => {
              if(xhr.status == 401){
                  // location.href = 'memberLogin.html'  
              }
          })
        },
        getVirtualHabitat2(){
  
          api.collecting.user_animals({lang: language, auth: this.config.token}).then( res => {
              this.Habitats2 = res;
          }).catch( (xhr, err) => {
              if(xhr.status == 401){
                  // location.href = 'memberLogin.html'
              }
          })
        },
      }
    })
  }
     
});


