$(function() {
  
  // INSERT YOUR JAVASCRIPT HERE
  $(window).bind('load resize', function() {

   
  });

  var language = getQueryString('lan') || 'CHT';
  var lan_id = getQueryString('lan_id') || 3;
  var valid = false;
  var config;

  getToken().then( res => { valid = true; config = res; })
  
  $(".member_login_submit").on('click', function(e) {
    e.preventDefault()

    if(!valid){
      alert('无法使用')
      return
    }

    let href = $(this).prop('href');

    var $username = $(".member_login .username").val();
    var $password = $(".member_login .password").val();

    if($username == '' || $password == ''){
      alert('请键入您的登入账号与密码')
      return;
    }

    api.auth.login({ lang: 'CN', auth: config.token}, {
      username: $username,
      password: $password
    }).then( res => {
      if(!res.hasOwnProperty('err_code')){
        sessionStorage.setItem('login', JSON.stringify(res));
        location.href = 'memberLanding.html?lang='+language+'&lan_id='+lan_id+'&lan='+language
      } else {
        alert('错误信息： '+res.err_msg + ', 错误码：' + res.err_code)
      }
    }).catch( error => {
      console.error('login error', error)
    })
    
  })


  // 重设密码
  $(".lang_reset_password").on('click', e => {
    e.preventDefault();
    
    var email = $('.lang_reset_placeholder').val();
    if(email == ''){
      alert('请输入登录邮箱')
      return;
    }

    api.auth.forgot_password({ lang: 'zh', auth: config.token}, {
      username: email
    }).then( res => {
      if(res.err_code == 0){

      } else {
        alert(res.err_msg)
      }
    }).catch( error => {
      console.error(error)
    })
  })
     
});


