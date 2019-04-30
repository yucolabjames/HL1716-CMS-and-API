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
  var valid = false;
  var config;

  getToken().then( res => { valid = true; config = res; })

  if(sessionStorage.getItem('login')){
    location.href = 'memberLanding.html'
  }
  
  $(".member_login_submit").on('click', function(e) {
    e.preventDefault()

    if(!valid){
      alert('未获取到Token，请刷新页面尝试')
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
        var back_url = getQueryString('back_url')
        if(back_url){
          location.href = back_url
        } else {
          location.href = 'memberLanding.html?lang='+language+'&lan_id='+lan_id+'&lan='+language;
        }
      } else {
        alert('错误信息： '+res.err_msg + ', 错误码：' + res.err_code)
      }
    }).catch( error => {
      console.error('login error', error)
    })
    
  })


  // 重设密码
  $("#forgotPassword").on('click', function(e) {
    e.preventDefault();
    
    var email = $('.lang_reset_placeholder').val();
    if(email == ''){
      alert('请输入登录邮箱')
      return;
    }
    console.log(email)
    api.auth.forgot_password({ lang: 'zh', auth: config.token}, {
      username: email
    }).then( res => {
      console.log(res)
      if(res.err_code == 0){

      } else {
        alert(res.err_msg)
      }
    }).catch( error => {
      console.error(error)
    })
  })
    

});


