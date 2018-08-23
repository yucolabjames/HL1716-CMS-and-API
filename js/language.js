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

        concat: {
          title: '聯絡我們',
          sub_title: '化主詩物趣足沒車心臺我大苦理體實'
        },
  
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
          title: '超載的地球',
          crisis: '2050 面臨毀滅性糧食危機',
          shenchan: '生産危機',
          liangshi: '本港糧食供應',
          nongye: '有機農業',
          navs1: '極端氣候變',
          navs2: '生物數目銳減',
          touch: '你感受到熱浪嗎？'
        },

        index: {
          lang_index_Continued: '可持續資源舘',
          biology_title: '生物資源也有耗盡的一天?'
        },

        footer_copyright: {
          copyright: '©2018 生物資源及農業研究所可持續資源館。版權所有，不得轉載。',
          about_me: '關注我們',
          links:[
            {
              text: '一般參觀守則',
            },
            {
              text: '參觀申請須知',
            },
            {
              text: '收集個人資料及私隱政策聲明'
            },
            {
              text: '免責聲明'
            }],
          addr: {
            label: '地址',
            value: '九龍塘浸會大學道'
          },
          opentime: {
            label: '開放時間',
            value: '星期一至日上午10時至下午7時'
          },
          phone: {
            label: '聯絡電話',
            value: '852-35008335'
          },
          email: {
            label: '電郵地址',
            value: 'info@bu.com'
          }
        },

        member: {
          title: '會員專區',
          name_placeholder: '登入賬號',
          password_placeholder: '登入密碼',
          infomation: 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis .',
          get_profile: '如何獲得登入資料？',
          for_password: '忘記密碼?',
          login_text: '立即<br>登入',
          reset_password: '重設密碼',
          reset_placeholder: '登入電郵'
        },
        member_landing: {
          title: '歡迎登入您的太空任務檔案。',
          task_count: '任務次數',
          collection: '累積收集',
          last_update_date: '最後更新日期',
          coll1: '消失的物種',
          coll2: '動物拯救隊',
          coll3: '有機耕種技術農夫影片集',
          coll4: '錦囊集',
          coll5: '低碳百貨',
          tab1: {
            chart_text: '種生物已解鎖'
          },
          tab5: {
            title: '低碳百貨',
            desc: `走進高端的購物中心，接受充滿挑戰的可持續消費訓練，認識現代消費模式，
            透過VR體驗重新審視日常生活習慣，了解背後的生態代價，學會做個精明環保的消費者。`,
            subtitle: '最近一次購物結算成績',
            sub_desc: '最不持續發展的地球消費',
            food: '新鮮食品',
            product: '日常用品',
            model: '全新造型'
          },
          hello: '您好',
          score: '分数',
          last_update: '最後更新日期',
          my_footprint: '我的足跡',
          my_account: '我的帳戶'
        },
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

        concat: {
          title: 'Concat me',
          sub_title: '化主詩物趣足沒車心臺我大苦理體實ENG'
        },
  
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
          copyright: '©2018 Institute of Bioresource and Agriculture Sustainability Gallery. All rights reserved.',
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
          title: '超載的地球ENG',
          crisis: '2050 面臨毀滅性糧食危機',
          shenchan: '生産危機Y',
          liangshi: '本港糧食供應Y',
          nongye: '有機農業Y',
          navs1: '極端氣候變ENG',
          navs2: '生物數目銳減ENG',
          touch: '你感受到熱浪嗎？ENG'
        },

        index: {
          lang_index_Continued: 'Continued',
          biology_title: '生物資源也有耗盡的一天?ENG'
        },

        member: {
          title: 'Member Area',
          name_placeholder: 'Account',
          password_placeholder: 'Password',
          infomation: 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis .',
          get_profile: 'How to get info?',
          for_password: 'forget password?',
          login_text: 'Login',
          reset_password: 'reset',
          reset_placeholder: 'email'
        },
        member_landing: {
          title: '歡迎登入您的太空任務檔案。ENG',
          task_count: '任務次數ENG',
          collection: '累積收集ENG',
          last_update_date: '最後更新日期ENG',
          coll1: '消失的物種ENG',
          coll2: '動物拯救隊ENG',
          coll3: '有機耕種技術農夫影片集ENG',
          coll4: '錦囊集ENG',
          coll5: '低碳百貨ENG',
          tab1: {
            chart_text: 'bio unlocked'
          },
          tab5: {
            title: '低碳百貨ENG',
            desc: `走進高端的購物中心，接受充滿挑戰的可持續消費訓練，認識現代消費模式，
            透過VR體驗重新審視日常生活習慣，了解背後的生態代價，學會做個精明環保的消費者。ENG`,
            subtitle: '最近一次購物結算成績ENG',
            sub_desc: '最不持續發展的地球消費ENG',
            food: '新鮮食品ENG',
            product: '日常用品ENG',
            model: '全新造型EG'
          },
          hello: 'hello',
          score: 'score',
          last_update: 'last update',
          my_footprint: '我的足跡ENG',
          my_account: '我的帳戶ENG'
        },

        footer_copyright: {
          copyright: '©2018 Institute of Bioresource and Agriculture Sustainability Gallery. All rights reserved.',
          about_me: 'watch',
          links:[
            {
              text: 'General Guidelines of Visit',
            },
            {
              text: 'Guidelines for Visit Booking',
            },
            {
              text: 'Privacy Policy'
            },
            {
              text: 'Disclaimer'
            }
          ],
          addr: {
            label: 'address',
            value: '九龍塘浸會大學道'
          },
          opentime: {
            label: 'opentime',
            value: '星期一至日上午10時至下午7時'
          },
          phone: {
            label: 'phone',
            value: '852-35008335'
          },
          email: {
            label: 'email',
            value: 'info@bu.com'
          }
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

        concat: {
          title: '联络我们',
          sub_title: '化主詩物趣足沒車心臺我大苦理體實'
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
          title: '超载的地球',
          crisis: '2050 面临毁灭性粮食危机',
          shenchan: '生产危机',
          liangshi: '本港粮食供应',
          nongye: '有机农业',
          navs1: '极端气候变',
          navs2: '生物数目锐减',
          touch: '你感受到热浪吗？'
        },
        index: {
          lang_index_Continued: '可持续资源馆',
          biology_title: '生物资源也有耗尽的一天?'
        },
        member: {
          title: '会员专区',
          name_placeholder: '登入账号',
          password_placeholder: '登入密码',
          infomation: '测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字',
          get_profile: '如何获得登入资料',
          for_password: '忘记密码?',
          login_text: '立即<br>登入',
          reset_password: '重设密码',
          reset_placeholder: '登入电邮'
        },
        member_landing: {
          title: '欢迎登入你的太空任务档案',
          task_count: '任务次数',
          collection: '累积收集',
          last_update_date: '最后更新日期',
          coll1: '消失的物种',
          coll2: '动物拯救队',
          coll3: '有机耕种农夫影片集',
          coll4: '锦囊集',
          coll5: '低碳百货',
          tab1: {
            chart_text: '种生物已解锁'
          },
          tab5: {
            title: '低碳百货',
            desc: `走进高端的购物中心，接受充满挑战的可持续消费训练，认识现代消费模式，通过VR体验重新审视日常生活习惯，了解背后的生态习惯，学会做个精明环保的消费者`,
            subtitle: '最后一次购物结算成绩',
            sub_desc: '最不持续发展的地球消费',
            food: '新鮮食品',
            product: '日常用品',
            model: '全新造型'
          },
          hello: '您好',
          score: '分数',
          last_update: '最后更新日期',
          my_footprint: '我的足迹',
          my_account: '我的账户'
        },
        footer_copyright: {
          copyright: '©2018 生物资源及农业研究所可持续资源馆。版权所有，不得转载。',
          about_me: '关注我们',
          links: [
            {
              text: '一般参观守则',
            },
            {
              text: '参观申请须知',
            },
            {
              text: '收集个人资料及私隐政策声明'
            },
            {
              text: '免责声明'
            }
          ],
          addr: {
            label: '地址',
            value: '九龙塘浸会大道'
          },
          opentime: {
            label: '开放时间',
            value: '星期一至日上午10时至下午7时'
          },
          phone: {
            label: '联络电话',
            value: '852-35008335'
          },
          email: {
            label: '电邮地址',
            value: 'info@bu.com'
          }
        }
      }
    }
    
    window.lang = lang;
    if(language !== '' && language !== 'CHT' && language !== 'CHS' && language !== "ENG"){
      language = 'CHT'
    }

    // members
    $('.lang_member_area_title').text(lang[language].member.title)
    $('.member_login .username').prop('placeholder', lang[language].member.name_placeholder)
    $('.member_login .password').prop('placeholder', lang[language].member.password_placeholder)
    $('.lang_member_login').html(lang[language].member.login_text)
    $('.lang_get_profile').html(lang[language].member.get_profile)
    $('.lang_forget_password').html(lang[language].member.for_password)
    $('.lang_reset_password').html(lang[language].member.reset_password)
    $('.lang_reset_placeholder').prop('placeholder', lang[language].member.reset_placeholder)
  
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
    $('.biology_title').text(lang[language].index.biology_title)
  
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
    $('.lang_about_title').text(lang[language].about.title)
    $('.lang_about_shengchan').text(lang[language].about.shenchan)
    $('.lang_about_liangshi').text(lang[language].about.liangshi)
    $('.lang_about_nongye').text(lang[language].about.nongye)
    $('.lang_about_navs1').text(lang[language].about.navs1)
    $('.lang_about_navs2').text(lang[language].about.navs2)
    $('.lang_about_touch').text(lang[language].about.touch)


    var lan_id = getQueryString('lan_id') || 3;
    $(".nav-menu li").each( (index, item) => {
      var href = $(item).find('a').prop('href')
      if(href){
        href += `?lan=${language}&lan_id=${lan_id}`;
        $(item).find('a').prop('href', href)
      }
      
    })

    $(".lang_about_link li").each((index, item) => {
      $(item).find('a').text(lang[language].footer_copyright.links[index].text)
    })

    $(".lang_footer_addr_label").text(lang[language].footer_copyright.addr.label)
    $(".lang_footer_addr_value").text(lang[language].footer_copyright.addr.value)

    $(".lang_footer_opentime_label").text(lang[language].footer_copyright.opentime.label)
    $(".lang_footer_opentime_value").text(lang[language].footer_copyright.opentime.value)

    $(".lang_footer_phone_label").text(lang[language].footer_copyright.phone.label)
    $(".lang_footer_phone_value").text(lang[language].footer_copyright.phone.value)

    $(".lang_footer_email_label").text(lang[language].footer_copyright.email.label)
    $(".lang_footer_email_value").text(lang[language].footer_copyright.email.value)
    $(".lang_footer_copyright").text(lang[language].footer_copyright.copyright)
    $(".lang_about_me").text(lang[language].footer_copyright.about_me)
    $('.lang_concat_title').text(lang[language].concat.title)
    $('.lang_concat_sub_title').text(lang[language].concat.sub_title)
  })();
  
  
})