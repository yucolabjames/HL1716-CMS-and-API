$(function () {
  // INSERT YOUR JAVASCRIPT HERE
  $(window).bind('load resize', function () {


  });
  

  // 获取数据
  var lang = getLocalStorage('hk_language');
  var language, lan_id;
  if(lang){
      language = lang.lan;
      lan_id = lang.lan_id;
  } else {
      language = 'CHT';
      lan_id = 3;
  }
  ((lan_id) => {
    
    const getApi = () => {
      $.post(api_host+'/api/Ehall/index', {
        language: lan_id
      }, res => {
        console.log( res )
        if(res.error_code == 0){
          $('.successes_count').text(res.res.successes)
          $('.pass_count').text(res.res.trainings)

          $('.count').each(function () {
              $(this).prop('Counter',0).animate({
                  Counter: $(this).text()
              }, {
                  duration: 4000,
                  easing: 'swing',
                  step: function (now) {
                      $(this).text(Math.ceil(now));
                  }
              });
          });

          $('.title').html(res.res.srp.title)
          $('.sub_title').html(res.res.srp.summary)

          $('.set1').css('background-image', 'url('+uploaded+'/'+res.res.images1.image+')')
          $('.set1 h4').html(res.res.images1.title)
          $('.set1 p').html(res.res.images1.summary)

          $('.set2').css('background-image', 'url('+uploaded+'/'+res.res.images2.image+')')
          $('.set2 h4').html(res.res.images2.title)
          $('.set2 p').html(res.res.images2.summary)

          $('.set3').css('background-image', 'url('+uploaded+'/'+res.res.images3.image+')')
          $('.set3 h4').html(res.res.images3.title)
          $('.set3 p').html(res.res.images3.summary)

          $('.set4').css('background-image', 'url('+uploaded+'/'+res.res.images4.image+')')
          $('.set4 h4').html(res.res.images4.title)
          $('.set4 p').html(res.res.images4.summary)

          $('.set5').css('background-image', 'url('+uploaded+'/'+res.res.images5.image+')')
          $('.set5 h4').html(res.res.images5.title)
          $('.set5 p').html(res.res.images5.summary)
          

          $('.section-hallIntro').show();
        }
      }, 'json')
    }

    getApi(lan_id);
  })(lan_id);



});


