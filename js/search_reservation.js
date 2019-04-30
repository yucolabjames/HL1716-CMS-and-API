$(function () {
  // INSERT YOUR JAVASCRIPT HERE
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
    el: "#vue_app",
    data: {
      language,

      booking_no: '',
      email: ''
    },
    computed: {

    },
    watch: { 
      
    },
    mounted(){
     
    },
    methods: {
      searchBooking(){
        if(this.order == '' || this.email == ''){
          alert('請輸入您的預約號碼和您預約时的電子郵件地址')
          return;
        }

        api.booking_detail({
          order_no: this.booking_no,
          email: this.email
        }).then( res => {
          console.log(res)
          if(res.error_code == 0){

            if(res.res == null){
              alert('未搜索到结果')
              return
            }

            // 保存或许要更改的订单
            localStorage.setItem('booking_no', JSON.stringify(res.res))
            
            window.location.href = 'search_result_reservation.html'+location.search
          } else {
            alert(res.msg)
          }
        })
      }

    }
  })



});


