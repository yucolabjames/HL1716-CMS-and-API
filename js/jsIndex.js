$(function() {
    // INSERT YOUR JAVASCRIPT HERE
   $(window).bind('load resize', function() {
      

      $('.widget-slider .grid-item').matchHeight({
        property: 'min-height' ,
      });

   
  });
  function getIndex(){
    var language = getQueryString('lan') || 'CHT';
    var lan_id = getQueryString('lan_id') || 3;
    $.get(api_host+'/api/Index/index?language='+lan_id, res => {
      handleData(res.res)
    }, 'json')

    function handleData(data){
      console.log(data)
      // banner
      var bannerHtml = ''
      data.banner.forEach( item => {
        var html = $.parseHTML(item.text)
        bannerHtml += `<div class="slideItem">
                          ${item.text}
                          <img src="${uploaded +''+ item.img}" class="img-full hidden-xs">
                        </div>`
                          // <img src="images/home/banner1_mobile.jpg" class="img-full visible-xs">

      })
      $('.bxslider').html(bannerHtml)
      $('.bxslider').bxSlider({
        auto: true,
        autoControls: false,   
        pager: true,
      });

      // 可持续资源馆
      var srpHtml = ''
      data.srp.forEach( item => {
        srpHtml += `<div class="grid-item">
                      <div clsas="img-wrapper"><img src="${uploaded + ''+ item.img}" class="img-full"></div>
                      <div class="text-wrapper">${item.text}</div>
                    </div>`
      })
      $(".paragh-wrapper").html(srpHtml)
      
      // 生物资源
      var biologyHtml = `<div class="col-xs-12 col-sm-6 col-md-8 img-wrapper grid-item">
                            <div class="pos-item spaceM"><div class="ani-float"><img src="images/home/spaceman.png" class="img-fluid"></div></div>
                            <img src="images/home/img-earth.png" class="img-fluid">
                          </div>
                          <div class="col-xs-12 col-sm-6 col-md-4 text-wrapper grid-item">
                              <div class="pos-text">
                                <div class="paragraph">估計<div class="font-large count"> ${data.ebr.number}</div>${data.ebr.text}</div>
                                <a href="about.html?lan_id=${lan_id}&language=${language}" class="btn theme1"><span class="icon"><img src="images/common/icon-next.svg" clsas="img-fluid"></span>再過100年地球將會?</a>
                            </div>
                          </div>`
      $("#biology").html(biologyHtml)
      $('.session-earth .grid-item').matchHeight({
        property: 'min-height' ,
      });
      $('.widget-slider .grid-item').matchHeight({
        property: 'min-height' ,
      });

      // 预定背景图
      $('#booking_preview').prop('src', uploaded + ''+ data.backg)


      // 展览馆平面图
      var zone = data.zone;
      $('.zone1').find('img').prop('src', uploaded+''+zone.zone1.img)
      $('.zone1').find('div').text(zone.zone1.text)

      $('.zone2').find('img').prop('src', uploaded+''+zone.zone2.img)
      $('.zone2').find('div').text(zone.zone2.text)

      $('.zone3').find('img').prop('src', uploaded+''+zone.zone3.img)
      $('.zone3').find('div').text(zone.zone3.text)

      $('.zone4').find('img').prop('src', uploaded+''+zone.zone4.img)
      $('.zone4').find('div').text(zone.zone4.text)

      $('.reception').find('img').prop('src', uploaded+''+zone.reception.img)
      $('.reception').find('div').text(zone.reception.text)

      $('.workshop').find('img').prop('src', uploaded+''+zone.workshop.img)
      $('.workshop').find('div').text(zone.workshop.text)

     
    }
  }

  getIndex();

   $('#responsive-slide').slick({
  dots:false,
  infinite: false,
  slidesToShow: 5,
  slidesToScroll: 1,
  responsive: [
    {
      breakpoint: 1024,
      settings: {
        slidesToShow: 5,
        slidesToScroll:5,
        infinite: true,
        dots: true
      }
    },
    {
      breakpoint: 600,
      settings: {
        slidesToShow: 2,
        slidesToScroll: 2
      }
    },
    {
      breakpoint: 480,
      settings: {
        slidesToShow: 1,
        slidesToScroll: 1
      }
    }
  
  ]
});

   

     
});