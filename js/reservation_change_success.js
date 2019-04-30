var lang = getLocalStorage('hk_language');
  var language, lan_id;
  if(lang){
      language = lang.lan;
      lan_id = lang.lan_id;
  } else {
      language = 'CHT';
      lan_id = 3;
  }

  var timer = setInterval(function(){
    if(lang){
      init(lang)
    } 
}, 3000);

function init(langPack){
  new Vue({
    el: '#vue_app',
    data: {
      lang:langPack,
      order: {}
    },
    mounted(){
      let order = sessionStorage.getItem('booking_no')
      let order_no = getQueryString('order_no')

      if(!order_no){
        alert('缺少订单编号')
        return;
      }
      if(order){
        this.order = JSON.parse(order)
        this.order.date = new Date(this.order.date * 1000).Format('yyyy-MM-dd')
      }
      this.init(order_no);
    },
    methods: {
      init(order_no){
        clearInterval(timer)
        api.booking_detail({order_no: order_no}).then( res => {

          if(res.error_code == 0){
              var param = res.res;

              $(".visitor_date").html(param.schedule_time)
              $(".visitor_child_count").html(param.child_count)
              $(".visitor_adult_count").html(param.visitor_count)
              if(param.group_name !== ''){
                  $(".group").show();
                  $("#groupName").html(param.group_name)
              }
              $('#bookingOrderNo').html(order_no)
              $("#lianluoren").html(function(){
                  var title = {
                      1: '先生',
                      2: '女士',
                      3: '小姐'
                  }
                  return param.last_name + param.first_name + title[param.title]
              }(param))
              $("#tel").html(param.phone)
              $("#email").html(param.email)
              $("#total_fee").html(param.pay)

              /*api.booking_add(res.res).then( res => {
                  if(res.error_code == 0){
                      $("#payBtn").removeClass('hidden').find('a').prop('href', res.res).addClass('clickable');
                  } else {
                      alert(res.msg)
                  }
              })*/

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