$(function() {
    // INSERT YOUR JAVASCRIPT HERE
   $(window).bind('resize load', function() {
    $(".widget-related").backstretch("images/news/newsBg2.jpg");
  });


  var messageid =  getQueryString('id')
  var subtitle = getQueryString('title')
  
  var lang = getLocalStorage('hk_language');
  var language, lan_id;
  if(lang){
      language = lang.lan;
      lan_id = lang.lan_id;
  } else {
      language = 'CHT';
      lan_id = 3;
  }
  var news_id = null; //消息的id

  getMessageDetail(messageid, lan_id)

  $(".lang_news_detail_title").prop('href', `news.html?lan=${language}&lan_id=${lan_id}`)
  $(".lang_news_detail_subtitle")
      .text(subtitle)
      .prop('href', `news.html?lan=${language}&lan_id=${lan_id}`)

  function getMessageDetail(messageid, lan_id){
    $.post(api_host + '/api/news/get', {
      id: messageid,
      language: Number(lan_id)||3
    }, res => {
      if(res.error_code == 0){
        news_id = res.res.id;
        getCommentList();  
        $(".session-newsBanner").css({
          'background-image': `url(${uploaded + ''+res.res.cover})`,
          'background-size': 'cover'
        })
        $('.content').html(res.res.content)

        var bannerHtml = ''
        if(res.res.banner){
          res.res.banner.forEach( item => {
            bannerHtml += `<div class="item">
                                <img src="${uploaded+''+item.url || item.image}" class="img-fluid">
                                <div class="text-wrapper">
                                <div class="title">${item.text}</div>
                                <div class="date">${new Date(item.date*1000).toDateString()}</div>
                                </div>
                            </div>`
          })
        }
        $('.relatedSlider').html(bannerHtml)
        $(".lang_news_detail_currenttitle").text(res.res.description)
        $(".lang_news_detail_subtitle").text(res.res.type_name)
        
        $(".widget-related").backstretch("images/news/newsBg2.jpg");
        $('.relatedSlider').bxSlider({
          auto: true,
          autoControls: false,
          minSlides:1,
          maxSlides:4,
          pager: false,
          slideWidth: 300,
        });

      }
    }, 'json')
  }

  $("#logged").show();

  $("#commentContentSubmit").on('click', function(){
    var content = $('textarea[name="comment-content"]').val();
    var login = sessionStorage.getItem('login');

    if(!login){
      alert('请先登录再评论')
      window.location.href = 'memberLogin.html?back_url='+window.location.href
      return
    }
    login = JSON.parse(login)
    if(content == ''){
      alert('Please input content!')
      return;
    }

    api.commentSubmit({
      news_id: news_id,
      language: lan_id,
      user_name: login.username,
      content: content
    }).then( res => {
      if(res.error_code == 0){
        alert('Submited')
        $('textarea[name="comment-content"]').val('')
        getCommentList()
      } else {
        alert(res.msg)
      }
    })
  })

  function getCommentList(){
    api.getCommentList({
      news_id: news_id,
      language: lan_id
    }).then( res => {
      
      if(res.error_code == 0){
        
        if(res.res.data.length == 0){  //没有评论
          $("#commentNothingData").show();
        } else if(res.res.data.length > 0){
          $("#commentNothingData").hide();
          var commentHtml = '';
          res.res.data.forEach( item => {
            commentHtml += `<div class="comment">
                              <div class="container">
                                <div class="comment-user">${item.user_name}</div>
                                <div class="comment-time">${timesToDate(item.create_time)}</div>
                                <div class="comment-content">
                                  ${item.content}
                                </div>
                              </div>
                            </div>`
          })

          
          $(".widget-comment #commentListWrap").html( commentHtml )
        }
      }
    })
  }

  function timesToDate(time){
    var date = new Date(time * 1000).Format('yyyy-MM-dd hh:mm')
    return date;
  }

  

});


