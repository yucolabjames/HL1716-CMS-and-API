$(function() {
    // INSERT YOUR JAVASCRIPT HERE
   $(window).bind('load resize', function() {

     
   
  });

  
  var language = getQueryString('lan') || 'CHT';
  new Vue({
    el: '#vue_app',
    data: {
      lang: lang[language],
      user: {}
    },
    mounted(){
      this.init();
      this.user = JSON.parse(sessionStorage.getItem('login'))
      console.log(this.lang)
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
          console.log('config', config)
          api.me.me({lang: language, auth: config.token}).then( res => {
            console.log( res )
          })
        })

        
      }
    }
  })

     
});


