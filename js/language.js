$(function(){
  function getLocalStorage(key){
    var store = localStorage.getItem(key);
    if(store){
      return JSON.parse(store)
    }
    return null
  }
  window.getLocalStorage = getLocalStorage;
  
  $(".select-language").on('click', 'li', (e) => {
    var target = e.target;

    var language = target.dataset.language;
    
    var search = location.search.substr(1).split('&')
    
    window.location.reload(true)

    var languageParam = {
      lan: language || 'CHT',
      lan_id: target.dataset.id || 3
    }
    localStorage.setItem("hk_language", JSON.stringify(languageParam))
  })

  if(getLocalStorage('hk_language')){
    $('.current_lang').html(getLocalStorage('hk_language').lan)
  }

  ;(() => {
    $.post(api_host+'/api/Language/index', res => {
      
      if(res.error_code == 0){
        var languageHTML = ``
        res.res.forEach( item => {
          languageHTML += `<li data-language="${item.language}" data-id="${item.id}">${item.name}</li>`
        })
        
        $('.select-language').html(languageHTML)

        if($('.current_lang').html() == ''){
          $('.current_lang').html(res.res[2].language);
          var languageParam = {
            lan: res.res[2].language || 'CHT',
            lan_id: res.res[2].id || 3
          }
          localStorage.setItem("hk_language", JSON.stringify(languageParam))
        }


        localStorage.setItem("hk_language_src", JSON.stringify(res.res))
      }
    }, 'json')
  })();
  
  // 渲染静态文字
  ;(() =>{
    var language = getQueryString('lan') || 'CHT';

    
    // window.lang = lang;
    // if(language !== '' && language !== 'CHT' && language !== 'CHS' && language !== "ENG"){
    //   language = 'CHT'
    // }

    // // members
    // $('.lang_member_area_title').text(lang[language].member.title)
    // $('.member_login .username').prop('placeholder', lang[language].member.name_placeholder)
    // $('.member_login .password').prop('placeholder', lang[language].member.password_placeholder)
    // $('.lang_member_login').html(lang[language].member.login_text)
    // $('.lang_get_profile').html(lang[language].member.get_profile)
    // $('.lang_forget_password').html(lang[language].member.for_password)
    // $('.lang_reset_password').html(lang[language].member.reset_password)
    // $('.lang_reset_placeholder').prop('placeholder', lang[language].member.reset_placeholder)
  
    // $('.sessionTitle').text(lang[language].sessionTitle)
    // $('.concat_username').attr('placeholder', lang[language].name)
    // $('.concat_email').attr('placeholder', lang[language].email)
    // $('.concat_phone').attr('placeholder', lang[language].phone)
    // $('.concat_reason').attr('placeholder', lang[language].reason)
    // $('.concat_submit').text(lang[language].submit)
    // $('.concat_reset').text(lang[language].reset)
  
    // $('.conc_phone').text(lang[language].concat_phone)
    // $('.conc_email').text(lang[language].concat_email)
    // $('.conc_addr').text(lang[language].office_addr)
    // $('.conc_office_time').text(lang[language].office_time)

    // $(".lang_load_booking_visit").text(lang[language].booking_process.title)
    // $(".lang_load_submit").text(lang[language].booking_process.submit)
    
    // // Home
    // $('.lang_index_Continued').text(lang[language].index.lang_index_Continued)
    // $('.biology_title').text(lang[language].index.biology_title)
  
    // // 主体导航语言更改
    // $('.nav1').text(lang[language].navigations.biology)
    // $('.nav2').text(lang[language].navigations.hall)
    // $('.nav3').text(lang[language].navigations.zhuanjia)
    // $('.nav4').text(lang[language].navigations.news)
    // $('.nav5').text(lang[language].navigations.member)
    // $('.nav6').text(lang[language].navigations.concat)
    // $('.nav7').text(lang[language].navigations.booking)

    // // footer
    // $('.bu_copyright').text(lang[language].footer.bu)
    // $('.lang_footer_email').text(lang[language].footer.email)
    // $('.lang_footer_phone').text(lang[language].footer.phone)
    // $('.lang_footer_time').text(lang[language].footer.time)
    // $('.lang_footer_addr').text(lang[language].footer.addr)
    // $('.lang_footer_copyright').text(lang[language].footer.copyright)
    // $('.lang_footer_mianze').text(lang[language].footer.mianze)
    // $('.lang_footer_private').text(lang[language].footer.private)
    // $('.lang_footer_guide').text(lang[language].footer.guide)
    
    // // faq
    // $(".faq_title").html(`<span class="icon">
    //                         <img src="images/common/icon-faq.svg">
    //                       </span>${lang[language].faq.question}`)
    // $(".lang_faq_search").attr('placeholder', lang[language].faq.useKw)

    // // news 
    // $(".lang_news_title").text(lang[language].news.title)
    // $(".lang_news_detail_title").text(lang[language].news_detail.title)
    
    // $(".lang_news_subtitle").text(lang[language].news.subTitle)
    // $('.lang_news_selecttype').text(lang[language].news.navs.selecttype)
    // $('.lang_news_all').text(lang[language].news.navs.all)
    // $('.lang_news_workshop').text(lang[language].news.navs.workshop)
    // $('.lang_news_media').text(lang[language].news.navs.media)
    // $('.lang_news_press').text(lang[language].news.navs.press)

    // // about
    // $('.lang_about_crisis').text(lang[language].about.crisis)
    // $('.lang_about_title').text(lang[language].about.title)
    // $('.lang_about_shengchan').text(lang[language].about.shenchan)
    // $('.lang_about_liangshi').text(lang[language].about.liangshi)
    // $('.lang_about_nongye').text(lang[language].about.nongye)
    // $('.lang_about_navs1').text(lang[language].about.navs1)
    // $('.lang_about_navs2').text(lang[language].about.navs2)
    // $('.lang_about_touch').text(lang[language].about.touch)


    // var lan_id = getQueryString('lan_id') || 3;
    // $(".nav-menu li").each( (index, item) => {
    //   var href = $(item).find('a').prop('href')
    //   if(href){
    //     href += `?lan=${language}&lan_id=${lan_id}`;
    //     $(item).find('a').prop('href', href)
    //   }
      
    // })

    

    
  })();
  
  
})