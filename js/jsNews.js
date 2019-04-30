$(function() {
    // INSERT YOUR JAVASCRIPT HERE
   $(window).bind('resize', initLayout);

  function initLayout(){
    $.backstretch("images/news/newsBg.jpg");
      
     

    $(".widget-related").backstretch("images/news/newsBg2.jpg");
    
    
    $('.relatedSlider').bxSlider({
      auto: true,
      autoControls: false,
      minSlides:1,
      maxSlides:2,
      pager: false,
      slideWidth: 500,
    });
  }

  var lang = getLocalStorage('hk_language');
  var language, lan_id;
  if(lang){
      language = lang.lan;
      lan_id = lang.lan_id;
  } else {
      language = 'CHT';
      lan_id = 3;
  }
  // 获取消息类型
  $.post(api_host + '/api/news/typelist', {
    language: lan_id
  }, res => {
    if(res.error_code == 0){
      var html = '<li class="active"><span class="lang_news_all cursor">all</span></li>'
      res.res.forEach( item => {
        html += `<li data-id="${item.id}" data-sort="${item.sort}" data-lan="${item.language}"><span class="cursor">${item.name}</span></li>`
      })
      $('.lang_news_navs').html(html)
      getNewsList('', lan_id)
    }
  }, 'json')


  $('.lang_news_navs').on('click', 'li', e => {
    $('.lang_news_navs li').removeClass('active')
    $(e.target).parent().addClass('active')

    var id = $(e.target).parent().data('id')
    
    getNewsList(id, lan_id)
  })

  function getNewsList(typeid, lan_id){
    $.post(api_host + '/api/news/index', {
      typeid,
      language: lan_id
    }, res => {
      if(res.error_code == 0){
        console.log(res)
        if(res.res.data.length == 0){
          $('.news_list').hide();
          return
        }
        $('.news_list').show();
        // $('.grid-item').each( (val, item) => {
        //   $(item).find('img').prop('src', uploaded+''+res.res.data[val].cover)
        //   $(item).find('.desp-title').text(res.res.data[val].description)
        //   $(item).find('date').text(res.res.data[val].data[0].date)
        //   $(item).find('tag').text(res.res.data[val].data[0].type_name+'a')
        //   $(item)
        //     .find('a')
        //     .attr('href', `newsDetail.html?id=${res.res.data[val].id}&title=${res.res.data[val].title}`)
        //     .attr({
        //       'data-id': res.res.data[val].id,
        //       'data-title': res.res.data[val].title
        //     })
        // })
        var html = '<div class="grid-sizer"></div>'
        res.res.data.forEach( item => {
          html += `<div class="grid-item theme2">
                    <a href="newsDetail.html?id=${item.id}&title=${item.title}">
                      <div class="grid-wrapper">
                      <div class="pos-text">
                        <div class="tag">${item.type_name}</div>
                        <div class="desp-title">${item.description}</div>
                        <div class="date">${new Date(item.date * 1000).toDateString()}</div>
                      </div>
                      <img src="${uploaded+item.cover}" class="img-full">
                    </div>
                    </a>
                  </div>`
        })

        $(".news_list").html(html)
        var $grid = $('.grid').imagesLoaded( function() {
          $grid.isotope({
            itemSelector: '.grid-item',
            percentPosition: true,
            masonry: {
              columnWidth: '.grid-sizer'
            }
          });
        });
        $.backstretch("images/news/newsBg.jpg");
      }

      $(".grid-item a").on('click', function(e) {
        sessionStorage.setItem('news_id', JSON.stringify({
          id: $(this).data('id'),
          title: $(this).data('title')
        }))
      })

      initLayout()
    }, 'json')
  }
     
});


