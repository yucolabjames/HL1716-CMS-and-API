$(function() {
    // INSERT YOUR JAVASCRIPT HERE
   $(window).bind('resize', initLayout);

  function initLayout(){
    $.backstretch("images/news/newsBg.jpg");
      
     var $grid = $('.grid').imagesLoaded( function() {
      $grid.isotope({
        itemSelector: '.grid-item',
        percentPosition: true,
        masonry: {
          columnWidth: '.grid-sizer'
        }
      });
    });

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

  var language = getQueryString('lan') || 'CHT';
  var lan_id = getQueryString('lan_id') || 3;
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
        if(res.res.data.length == 0){
          $('.news_list').hide();
          return
        }
        $('.news_list').show();
        $('.grid-item').each( (val, item) => {
          $(item).find('img').prop('src', uploaded+''+res.res.data[val].cover)
          $(item).find('.desp-title').text(res.res.data[val].description)
          $(item).find('date').text(res.res.data[val].data[0].date)
          $(item)
            .find('a')
            .attr('href', `newsDetail.html?lan_id=${lan_id}&lan=${language}&lang=${language}`)
            .attr({
              'data-id': res.res.data[val].id,
              'data-title': res.res.data[val].data[0].title
            })
        })
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


