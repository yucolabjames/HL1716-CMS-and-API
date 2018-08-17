$(function() {
  
  // INSERT YOUR JAVASCRIPT HERE
  $(window).bind('load resize', function() {

   
  });

  var language = getQueryString('lan') || 'CHT';
  var lan_id = getQueryString('lan_id') || 3;
  console.log(lang)
  
  $(".member_login_submit").on('click', function(e) {
    e.preventDefault()
    let href = $(this).prop('href');

    var $username = $(".member_login .username").val();
    var $password = $(".member_login .password").val();

    if($username == '' || $password == ''){
      alert('请键入您的登入账号')
      return;
    }

    
  })
     
});


