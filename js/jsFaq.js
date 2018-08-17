$(function () {

  // 获取数据
  (() => {
    var language = getQueryString('lan') || 'CHT';
    var lan_id = getQueryString('lan_id') || 3
    
    const getApi = () => {

      // get question list
      $.post(api_host+'/api/Eqaa/typelist', {
        language: lan_id
      }, res => {
        if(res.error_code == 0){
          var questionHtml = `<li role="presentation" class="active">
                                <a href="#home" data-id="" aria-controls="home" role="tab" data-toggle="tab">All</a>
                              </li>`
          res.res.forEach( item => {
            questionHtml += ` <li role="presentation" >
                                <a href="#home${item.id}" data-id="${item.id}" aria-controls="home" role="tab" data-toggle="tab">${item.name}</a>
                              </li>`
          })
          $('.question_list').html(questionHtml)
          getAnwserList('', '',1, lan_id)
          
          // 根据问题获取列表
          $('.question_list').on('click', 'a', e => {
            var typeid = e.target.dataset.id;
            getAnwserList('', typeid, 1, lan_id)
          })
        }
      }, 'json')

      // get answer list
      // $.post(api_host + '/api/Eqaa/index',)
    }

    getApi();

    $(".lang_faq_search").on('keydown', e => {
      if(e.keyCode == 13){
        var val = $('.lang_faq_search').val();
        if(val == ''){
          alert('请输入查询关键字')
          $('.lang_faq_search').focus();
          return 
        }
    
        getAnwserList(val, '', 1, lan_id)
      }
    })

    // 获取问答列表
    function getAnwserList(kw, typeid, page, lan_id){
      $.post(api_host + '/api/Eqaa/index', {
        typeid,
        page,
        language:lan_id,
        keyword: kw
      }, res => {
        if(res.error_code == 0){
          var html = ``
          res.res.data.forEach( item => {
            html += `<div class="faqGrid">
                        <div class="panel-heading" role="tab" id="headingOne">
                          <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                              <span class="icon">
                                <img src="images/faq/icon-q.png" class="img-fluid">
                              </span>${item.ask}
                            </a>
                          </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                          <div class="pbody">
                            <span class="icon">
                              <img src="images/faq/icon-a.png" class="img-fluid">
                            </span>
                            <span class="msg">${item.answer}</span>
                          </div>
                        </div>
                      </div>`
          })

          $('.answer_list').html(html)
          $('.lang_faq_search').val('')
        }
      }, 'json')
    }

    $('.searchBtn').on('click', e => {
      var kw = $('.lang_faq_search').val();
      if(kw == ''){
        alert('请输入查询关键字')
        $('.lang_faq_search').focus();
        return 
      }
  
      getAnwserList(kw, '', 1, lan_id)
    })

  })();


  
});


