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
  $.post(api_host+'/api/Eqaa/typelist', {
    language: lan_id
  }, res => {
    if(res.error_code == 0){
      var questionHtml = ''
      res.res.forEach( item => {
        questionHtml += `<option value="${item.id}">${item.name}</option>`
      })
      $('.faq_question_list').html(questionHtml)
    }
  }, 'json')

  
  $('.concat_reset').on('click', e => {
    $('#forms_question input, #forms_question textarea').val('')
  })
  $('.concat_submit').on('click', e => {
    var $uname = $('.question_form .username').val();
    var $email = $('.question_form .email').val();
    var $phone = $('.question_form .phone').val();
    var $type = $('.question_form .faq_question_list').val();
    var $reason = $('.question_form .reason').val();

    $.post(api_host + '/api/Eqaa/add', {
      name: $uname,
      email: $email,
      tel: $phone,
      type_id: $type,
      ask: $reason,
      language: lan_id || 3
    }, res => {
      if(res.error_code == 0){
        alert('提问成功')
        setTimeout(() => {
          location.href = 'faq.html'
        }, 500)
      } else {
        alert(res.msg)
      }
    }, 'json')

  })
})