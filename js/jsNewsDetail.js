$(function() {
    // INSERT YOUR JAVASCRIPT HERE
   $(window).bind('resize', function() {



    
    

    $(".widget-related").backstretch("images/news/newsBg2.jpg");

   
  });



  var messageid = sessionStorage.getItem('news_id')
  var lan_id = getQueryString('lan_id')
  getMessageDetail(messageid, lan_id)

  function getMessageDetail(messageid, lan_id){
    $.post(api_host + '/public/api/news/get', {
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


