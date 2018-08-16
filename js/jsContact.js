$(function() {
    // INSERT YOUR JAVASCRIPT HERE
   $(window).bind('load resize', function() {
   
  });

  

  // 获取语言种类
  ;(() => {
    $.post(api_host+'/public/api/Language/index', res => {

      if(res.error_code == 0){
        var languageHTML = ``
        res.res.forEach( item => {
          languageHTML += `<li data-language="${item.language}" data-language-id="${item.id}">${item.name}</li>`
        })
        $('.select-language').html(languageHTML)
      }
    })
  })();
  
  var language = getQueryString('lan') || 'CHT';
  var lan_id = getQueryString('lan_id') || 3;
  // 获取网页数据
  ;(() => {
    
    $.post(api_host+'/public/api/contact/index', { language:lan_id }, res => {
      if(res.error_code == 0){
        $('.concat_phone').text(res.res.tel)
        $('.concat_email').html(`<a class="link" href="mailto:${res.res.email}">${res.res.email}</a>`)

        $(".concat_banner").css('background-image', 'url('+uploaded+'/'+res.res.header+')')
        $('.concat_addr').text(res.res.data[0].address)
        $('.concat_office').text(res.res.data[0].office_hours)

        $('.concat_banner h1').text(res.res.data[0].header_title)
        $('.concat_banner p').text(res.res.data[0].header_content)
      }
    })
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

    $.post(api_host + '/public/api/contact/opinion', {
      name: $uname,
      email: $email,
      tel: $phone,
      content: $content,
      language: lan_id || 3
    }, res => {
      if(res.error_code == 0){
        alert('提交成功')
      } else {
        alert(res.msg)
      }
    }, 'json')

  })

  
  
     
});



