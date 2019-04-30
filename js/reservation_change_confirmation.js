$(function(){
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
      lang: {},
      language,
      order: {}
    },
    mounted(){
      let order = sessionStorage.getItem('booking_no')
      if(order){
        this.order = JSON.parse(order)
        this.order.date = new Date(this.order.date * 1000).Format('yyyy-MM-dd')
      }
    },
    methods: {
      updateScheduleDate(){
      api.order_mod({
        order_no: this.order.order_no,
        schedule_id: this.order.schedule_id
      }).then( res => {
        if(res.error_code == 0){
          location.href = 'reservation_change_success.html' + location.search
        } else {
          alert(res.msg)
        }
      })
      }
    },
    filters: {
      sex(val){
        const sex = {
          1: '先生',
          2: '女士',
          3: '小姐'
        }

        return sex[val]
      }
    }
  })

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
})