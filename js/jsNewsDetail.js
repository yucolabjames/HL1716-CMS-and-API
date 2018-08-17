$(function() {
    // INSERT YOUR JAVASCRIPT HERE
   $(window).bind('resize', function() {



    
    

    $(".widget-related").backstretch("images/news/newsBg2.jpg");

   
  });


  var sessionData = JSON.parse(sessionStorage.getItem('news_id'))
  var messageid = sessionData.id
  var subtitle = sessionData.title
  
  var lan_id = getQueryString('lan_id')
  var language = getQueryString('lan')

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
        $(".session-newsBanner").css({
          'background-image': `url(${uploaded + ''+res.res.header})`,
          'background-size': 'cover'
        })
        $('.content').html(res.res.content)

        var bannerHtml = ''
        res.res.banner.forEach( item => {
          bannerHtml += `<div class="item">
                              <img src="${uploaded+''+item.image}" class="img-fluid">
                              <div class="text-wrapper">
                              <div class="title">${item.title}</div>
                              <div class="date">${new Date(item.date*1000).toDateString()}</div>
                              </div>
                          </div>`
        })
        $('.relatedSlider').html(bannerHtml)
        $(".lang_news_detail_currenttitle").text(res.res.description)
        $('.relatedSlider').bxSlider({
          auto: true,
          autoControls: false,
          minSlides:1,
          maxSlides:2,
          pager: false,
          slideWidth: 500,
        });

        $(".widget-related").backstretch("images/news/newsBg2.jpg");
      }
    }, 'json')
  }
});


