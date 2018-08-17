$(function(){
  var lang = getQueryString('lan') || 'CHT';
  $('.current_lang').html(lang)
  $(".select-language").on('click', 'li', (e) => {
    var target = e.target;

    var language = target.dataset.language;
    
    var search = location.search.substr(1).split('&')
    
    window.location.search = '?lan='+language+'&lan_id='+target.dataset.id+'&lang='+target.dataset.language;
  })

  ;(() => {
    $.post(api_host+'/api/Language/index', res => {
  
      if(res.error_code == 0){
        var languageHTML = ``
        var lang = ''
        res.res.forEach( item => {
          languageHTML += `<li data-language="${item.language}" data-id="${item.id}">${item.name}</li>`
          
        })
        
        $('.select-language').html(languageHTML)

        if($('.current_lang').html() == ''){
          res.res.forEach( item => {
            if(item.id === 'CHT'){
              $('.current_lang').html(item.language)
            }
          })
        }
      }
    }, 'json')
  })();
  
  // 渲染静态文字
  ;(() =>{
    var language = getQueryString('lan') || 'CHT';
  
    const lang = {
      CHT: {
        sessionTitle: '意見及查詢表格',
        name: '姓名*',
        email: '電郵*',
        phone: '電話*',
        reason: '意見或詢問*',
        reset: '> 重置',
        submit: '> 遞交',
        concat_phone: '聯絡電話:',
        concat_email: '電子郵箱:',
        office_addr: '辦公地址:',
        office_time: '辦公時間:',
  
        navigations: {
          biology: '生物資源與農業',
          hall: '展覽館',
          zhuanjia: '問問專家',
          news: '最新消息',
          member: '會員專區',
          concat: '聯絡我們',
          booking: '預約'
        },

        footer: {
          copyright: '版權',
          mianze: '免責聲明',
          private: '私隱政策聲明',
          guide: '網頁指南',
          addr: '地址',
          time: '開放時間',
          phone: '聯絡電話',
          email: '電郵地址',
          bu: 'BU©版權所有2018 。'
        },

        faq: {
          question: '問問專家',
          useKw: '使用關鍵字'
        },

        news: {
          title: '最新消息繁体',
          subTitle: "最新消息繁体2",

          navs: {
            selecttype: '选择类型繁',
            all: '全部繁',
            workshop: '工作间繁',
            media: '媒体繁',
            press: '进程繁'
          }
        },
        news_detail: {
          title: '最新消息繁体'
        },

        about: {
          crisis: '2050 面臨毀滅性糧食危機',
          shenchan: '生産危機',
          liangshi: '本港糧食供應',
          nongye: '有機農業'
        },

        index: {
          lang_index_Continued: '可持續資源舘'
        }
      },

      ENG: {
        sessionTitle: 'chaxun',
        name: 'name*',
        email: 'email*',
        phone: 'phone*',
        reason: 'xunwen*',
        reset: '> reset',
        submit: '> submit',
        concat_phone: 'concat phone:',
        concat_email: 'email:',
        office_addr: 'office addr:',
        office_time: 'office time:',
  
        navigations: {
          biology: '生物资源与农业y',
          hall: '展览馆y',
          zhuanjia: '问问专家y',
          news: '最新消息y',
          member: '会员专区y',
          concat: '联络我们y',
          booking: '预约y',
          
        },

        footer: {
          copyright: '版权y',
          mianze: '免责声明y',
          private: '私隐政策声明y',
          guide: '网页指南y',
          addr: '地址y',
          time: '开放时间y',
          phone: '联络电话y',
          email: '电邮地址y',
          bu: 'BU©版权所有2018 。y'
        },

        faq: {
          question: '问问专家y',
          useKw: '使用关键字y'
        },

        news: {
          title: 'LASTE NEWS',
          subTitle: "最新消息y",

          navs: {
            selecttype: '选择类型y',
            all: '全部y',
            workshop: '工作间y',
            media: '媒体y',
            press: '进程y'
          }
        },

        news_detail: {
          title: 'NEWS'
        },
        about: {
          crisis: '2050 面臨毀滅性糧食危機',
          shenchan: '生産危機Y',
          liangshi: '本港糧食供應Y',
          nongye: '有機農業Y'
        },

        index: {
          lang_index_Continued: 'Continued'
        }
      },
      CHS: {
        sessionTitle: '意见及查询表格',
        name: '姓名*',
        email: '电邮*',
        phone: '电话*',
        reason: '意见或询问*',
        reset: '> 重置',
        submit: '> 递交',
        concat_phone: '联络电话:',
        concat_email: '电子邮箱:',
        office_addr: '办公地址:',
        office_time: '办公时间:',
  
        navigations: {
          biology: '生物资源与农业',
          hall: '展览馆',
          zhuanjia: '问问专家',
          news: '最新消息',
          member: '会员专区',
          concat: '联络我们',
          booking: '预约',
          
        },

        footer: {
          copyright: '版权',
          mianze: '免责声明',
          private: '私隐政策声明',
          guide: '网页指南',
          addr: '地址',
          time: '开放时间',
          phone: '联络电话',
          email: '电邮地址',
          bu: 'BU©版权所有2018 。'
        },

        faq: {
          question: '问问专家',
          useKw: '使用关键字'
        },

        news: {
          title: '最新消息',
          subTitle: "最新消息2",

          navs: {
            selecttype: '选择类型',
            all: '全部',
            workshop: '工作间',
            media: '媒体',
            press: '进程'
          }
        },
        news_detail: {
          title: '最新消息'
        },

        about: {
          crisis: '2050 面临毁灭性粮食危机',
          shenchan: '生产危机',
          liangshi: '本港粮食供应',
          nongye: '有机农业'
        },
        index: {
          lang_index_Continued: '可持续资源馆'
        }
      }
    }
    console.log(language)
    if(language !== '' && language !== 'CHT' && language !== 'CHS' && language !== "ENG"){
      language = 'CHT'
    }
  
    $('.sessionTitle').text(lang[language].sessionTitle)
    $('.concat_username').attr('placeholder', lang[language].name)
    $('.concat_email').attr('placeholder', lang[language].email)
    $('.concat_phone').attr('placeholder', lang[language].phone)
    $('.concat_reason').attr('placeholder', lang[language].reason)
    $('.concat_submit').text(lang[language].submit)
    $('.concat_reset').text(lang[language].reset)
  
    $('.conc_phone').text(lang[language].concat_phone)
    $('.conc_email').text(lang[language].concat_email)
    $('.conc_addr').text(lang[language].office_addr)
    $('.conc_office_time').text(lang[language].office_time)
    
    // Home
    $('.lang_index_Continued').text(lang[language].index.lang_index_Continued)
  
    // 主体导航语言更改
    $('.nav1').text(lang[language].navigations.biology)
    $('.nav2').text(lang[language].navigations.hall)
    $('.nav3').text(lang[language].navigations.zhuanjia)
    $('.nav4').text(lang[language].navigations.news)
    $('.nav5').text(lang[language].navigations.member)
    $('.nav6').text(lang[language].navigations.concat)
    $('.nav7').text(lang[language].navigations.booking)

    // footer
    $('.bu_copyright').text(lang[language].footer.bu)
    $('.lang_footer_email').text(lang[language].footer.email)
    $('.lang_footer_phone').text(lang[language].footer.phone)
    $('.lang_footer_time').text(lang[language].footer.time)
    $('.lang_footer_addr').text(lang[language].footer.addr)
    $('.lang_footer_copyright').text(lang[language].footer.copyright)
    $('.lang_footer_mianze').text(lang[language].footer.mianze)
    $('.lang_footer_private').text(lang[language].footer.private)
    $('.lang_footer_guide').text(lang[language].footer.guide)
    
    // faq
    $(".faq_title").html(`<span class="icon">
                            <img src="images/common/icon-faq.svg">
                          </span>${lang[language].faq.question}`)
    $(".lang_faq_search").attr('placeholder', lang[language].faq.useKw)

    // news 
    $(".lang_news_title").text(lang[language].news.title)
    $(".lang_news_detail_title").text(lang[language].news_detail.title)
    
    $(".lang_news_subtitle").text(lang[language].news.subTitle)
    $('.lang_news_selecttype').text(lang[language].news.navs.selecttype)
    $('.lang_news_all').text(lang[language].news.navs.all)
    $('.lang_news_workshop').text(lang[language].news.navs.workshop)
    $('.lang_news_media').text(lang[language].news.navs.media)
    $('.lang_news_press').text(lang[language].news.navs.press)

    // about
    $('.lang_about_crisis').text(lang[language].about.crisis)
    $('.lang_about_shengchan').text(lang[language].about.shenchan)
    $('.lang_about_liangshi').text(lang[language].about.liangshi)
    $('.lang_about_nongye').text(lang[language].about.nongye)


    var lan_id = getQueryString('lan_id') || 3;
    $(".nav-menu li").each( (index, item) => {
      var href = $(item).find('a').prop('href')
      if(href){
        href += `?lan=${language}&lan_id=${lan_id}`;
        $(item).find('a').prop('href', href)
      }
      
    })
  })();
  
  
})