$(function () {
  // INSERT YOUR JAVASCRIPT HERE
    // INSERT YOUR JAVASCRIPT HERE
    var totalVisitor = 40;
    
   $(".numbers-row").append('<div class="inc button">+</div><div class="dec button">-</div>');

   $("input[name=adult-counter]").on('input', function(event){
    if(event.target.value == '') {
      $('#adultCount').html(0)
      $('#adultTotalPrice').html(`$0.00`)
      return
    }
    var adultCount = parseInt($('#adult-counter').val());
    var studentCount = parseInt($('#student-counter').val())
    var value = parseInt(event.target.value)

    if((value + studentCount) >= totalVisitor){
      value = totalVisitor - studentCount
      $(this).val(value)
    } else{
      $(this).val(event.target.value.replace(/\D/g, ''))
    }

    $('#adultCount').html(value)
    $('#adultTotalPrice').html(`$${value * 100}.00`)
    
    
   })

   $("input[name=student-counter]").on('input', function(event){
    if(event.target.value == '') {
      $('#studentCount').html(0)
      $('#studentTotalPrice').html(`$0.00`)
      return
    }
      var adultCount = parseInt($('#adult-counter').val());
      var studentCount = parseInt($('#student-counter').val())
      var value = parseInt(event.target.value)
      if((value + studentCount) >= totalVisitor){
        value = totalVisitor - adultCount
        $(this).val(value)
      } else{
        $(this).val(event.target.value.replace(/\D/g, ''))
      }
      $('#studentCount').html(value)
      $('#studentTotalPrice').html(`$${value * 100}.00`)
   })

	  $(".button").on("click", function() {
      var adultCount, studentCount;
      if($('#adult-counter').val() == ''){
        adultCount = 0
      } else {
        adultCount = parseInt($('#adult-counter').val()) 
      }

      if($('#student-counter').val() == ''){
        studentCount = 0
      } else {
        studentCount = parseInt($('#student-counter').val()) 
      }

      
      console.log()
      var $button = $(this);
      var oldValue = $button.parent().find("input").val() || 0;

      if ($button.text() == "+") {
        if(adultCount + studentCount >= totalVisitor) return;
        var newVal = parseFloat(oldValue) + 1;
      } else {
      // Don't allow decrementing below zero
        if (oldValue > 0) {
        var newVal = parseFloat(oldValue) - 1;
        } else {
        newVal = 0;
        }
      }
    
      $button.parent().find("input").val(newVal);
      var inputName = $button.parent().find('input').prop('name')
      if(inputName == 'adult-counter'){
        $('#adultCount').html(newVal)
        $('#adultTotalPrice').html(`$${newVal * 100}.00`)
      } else if(inputName == 'student-counter'){
        $('#studentCount').html(newVal)
        $('#studentTotalPrice').html(`$${newVal * 100}.00`)
      }

	  });

	  

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

  var lang = getLocalStorage('hk_language');
  var language, lan_id;
  if(lang){
      language = lang.lan;
      lan_id = lang.lan_id;
  } else {
      language = 'CHT';
      lan_id = 3;
  }


  // 预订团体类型选择
  $('.act_group_type .item').each( function(){
    $(this).click(function(){
      $(this).addClass('active').siblings().removeClass('active');
      $("#is_group").val($(this).data('is-group'))
    })
  })

  // 年级
  $("input[name='grade']").on('change', function(){
    var grade = $("input[name='grade']:checked").val();
    $('#grade').val(grade)
  })

  // 参观展品内容会展示
  $('input[name="lang"]').on('change', function(){
    var lang = $('input[name="lang"]:checked').val();
    $("#visitorLanguage").val(lang)
  })

  // 根据折扣代码搜索优惠金额
  $('input[name=discount-code]').on('keydown blur', function(event){
    if(event.keyCode == 13 || (event.type == 'blur' && $(this).val() !== '' )){
      var code = $(this).val();
      api.getCouponCode({coupon_code: code}).then( res => {
        if(res.error_code == 0){
          $('.couponPrice').html(`-${res.res.discount}.00`)
          $('#couponCode').val(res.res.discount)
        } else {
          alert(res.msg)
        }
      })
    }
  })

  // 取消折扣代码
  $('#cancelUseCoupon').click( function(){
    $('.couponPrice').html(`-$0.00`)
    $('#couponCode').val(0)
  })

  $("#Step1Confirm").on('click', function(){
    var visitor_count = $('input[name=adult-counter]').val();
    if(visitor_count == 0){
      alert('请至少选择一名成人')
      return
    }

    var child_count = $('input[name=student-counter').val();
    var grade = $('input#grade').val();
    var is_group =$('input#is_group').val();
    var coupon = $('input#couponCode').val();
    var coupon_code = $('input.discount').val();

    var param = {
      visitor_count: visitor_count, //成人人数
      child_count: child_count, //学生人数
      grade: grade, //年级
      is_group: is_group, //是否团队，
      coupon_code: coupon_code, //折扣金额
      pay: coupon    //折扣码
    }

    sessionStorage.setItem('booking', JSON.stringify(param));

    location.href = 'reservation_calendar.html'
    
  })
  
});


