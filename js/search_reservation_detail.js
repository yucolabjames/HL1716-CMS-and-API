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


  function timetodateweek(timestamp){
    var date = new Date(timestamp);
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var dates = date.getDate();
    var weekDay = date.getDay();
  
    var week = {
      0: '日',
      1: '一',
      2: '二',
      3: '三',
      4: '四',
      5: '五',
      6: '六'
    }
  
    return year + '年' + fixed( month ) +'月' + fixed(dates) +  '日 星期' + week[weekDay] 
  }
  
  function fixed( num ){
    return num < 10 ? '0' + num : num;
  }

  new Vue({
    el: "#vue_app",
    data: {
      lang: {},
      language,

      form: {}
    },
    computed: {

    },
    watch: {
      
    },
    mounted(){
      this.getInfo();
    },
    methods: {
      getInfo(){
        var form = JSON.parse(localStorage.getItem('booking_no'))

        if(!form){
          location.href = 'search_reservation.html'
        }
        form.visit_date = timetodateweek( form.date * 1000)
        form.apm = form.start_time > 43200 ? 'PM' : 'AM'
        form.start = new Date((form.date+form.start_time) * 1000).Format('hh:mm')
        form.end = new Date((form.date+form.end_time) * 1000).Format('hh:mm')
        
        this.form = form;
      }

    }
  })



});


