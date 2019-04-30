$(function() {
    // INSERT YOUR JAVASCRIPT HERE
   $(window).bind('load resize', function() {
   
  });

  
  var lang = getLocalStorage('hk_language');
  var language, lan_id;
  if(lang){
      language = lang.lan;
      lan_id = lang.lan_id;
  } else {
      language = 'CHT';
      lan_id = 3;
  }
  // 获取网页数据
  ;(() => {
    
    $.post(api_host+'/api/contact/index', { language: lan_id }, res => {
      if(res.error_code == 0){
        $('.concat_phone').text(res.res.tel)
        $('.concat_email').html(`<a class="link" href="mailto:${res.res.email}">${res.res.email}</a>`)
        console.log(res)
        $(".concat_banner").css('background-image', 'url('+uploaded+''+res.res.header+')')
        $('.concat_addr').text(res.res.address)
        $('.concat_office').text(res.res.office_hours)

        $('.concat_banner h1').text(res.res.header_title)
        $('.concat_banner p').text(res.res.header_content)

        $(".address_load").text('位置 ：' + res.res.address)
        $(".header_title").text(res.res.header_title)
        $(".open_time").text(res.res.office_hours)
        $(".tel").html(`<a href="tel://${res.res.tel}"><i class="fa fa-envelope" aria-hidden="true"></i> ${res.res.tel}</a>`)
        $(".email").html(`<a href="tel://${res.res.email}"><i class="fa fa-envelope" aria-hidden="true"></i> ${res.res.email}</a>`)
      }
    }, 'json')
  })();

  $('.concat_reset').on('click', e => {
    e.preventDefault();
    $('.question_form input, .question_form textarea').val('')
  })

  $('.concat_submit').on('click', e => {
    e.preventDefault();
    var $uname = $('.question_form .username').val();
    var $email = $('.question_form .email').val();
    var $phone = $('.question_form .phone').val();
    var $content = $('.question_form .content').val();

    $.post(api_host + '/api/contact/opinion', {
      name: $uname,
      email: $email,
      tel: $phone,
      content: $content,
      language: lan_id || 3
    }, res => {
      if(res.error_code == 0){
        alert('提交成功')
        $('.question_form input, .question_form textarea').val('')
      } else {
        alert(res.msg)
      }
    }, 'json')

  })

  
  
     
});



