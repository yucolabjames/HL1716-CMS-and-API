$(function () {
    // INSERT YOUR JAVASCRIPT HERE
    $(window).bind('load resize', function () {

        $('#btn1').on('click', function (event) {
            $(".section-slide").hide()
            $('.section-slide#slide2').fadeIn(500);
        });

        $('#btn2').on('click', function (event) {
            $(".section-slide").hide()
            $('.section-slide#slide1').fadeIn(500);
        });

    });

    


    $('.circle-ripple').on("click", function (e) {
        e.preventDefault();
        $(".circle-ripple").removeClass("active");
        $(this).addClass("active");
        var id = $(this).attr('data-related');
        $(".section-case1 .text-wrapper").each(function () {
            $(this).hide();
            if ($(this).attr('id') == id) {
                $(this).fadeIn(500);
            }
        });

    });


    // var language = getQueryString('lan') || 'CHT';
    // var lan_id = getQueryString('lan_id') || 3;

    var lang = getLocalStorage('hk_language');
    var language, lan_id;
    if(lang){
        language = lang.lan;
        lan_id = lang.lan_id;
    } else {
        language = 'CHT';
        lan_id = 3;
    }

    getBiology(lan_id);

    function getBiology(lan_id){
        
        $.post(api_host+'/api/Braa/index',{
            language: lan_id
        }, res => {
            if(res.error_code == 0){
                var ext = res.res.ext_climate
                var bio = res.res.biologicals
                $('.Landslide').text(ext.Landslide)
                $('.Earthquake').text(ext.Earthquake)
                $('.temperature').text(ext.temperature)
                $('.Extreme_Temperature').text(ext.Extreme_Temperature)
                $('.Volcanic_Activity').text(ext.Volcanic_Activity)
                $('.flood_text').text(ext.flood)
                
                $('.lang_temperature').html(ext.temperature+'<span class="small-font">°C</span>')
                $('.lang_Storm').html(ext.storm)
                $('.lang_Drought').html(ext.drougt)
                $('.lang_Wildfire').html(ext.wildfire)
                $('.lang_old_year_1').html(ext.tips[0])
                $('.lang_old_year_2').html(ext.tips[1]) 
                $('.lang_old_year_3').html(ext.tips[2])
                $('.lang_old_year_4').html(ext.tips[3])
                $('.lang_old_year').html(ext.year)
                
                $('.biologicals_summary').html(bio.summary)
                $('.biologicals_year').text(bio.year)
                $('.biologicals_land').text(bio.land)
                $('.biologicals_organisms').text(bio.Freshwater_organisms)
                $('.biologicals_Marine_organism').text(bio.Marine_organism)

                // 生产危机
                var produce = res.res.produce_crisis
                $('.lang_yanmo').text(produce.content1)

                // 粮食供应
                var food = res.res.food_supply
                $('.food_title').text(food.summary)

                $(".food_content1 img").prop('src', uploaded+''+food.content1.image)
                $(".food_content1 .txt").html(food.content1.intro)

                $(".food_content2 img").prop('src', uploaded+''+food.content2.image)
                $(".food_content2 .txt").html(food.content2.intro)

                $(".food_content3 img").prop('src', uploaded+''+food.content3.image)
                $(".food_content3 .txt").html(food.content3.intro)

                // 有机农业
                var org = res.res.organic_agri;
                $(".Agriculture_title").html(org.title)
                $(".Agriculture_subtitle").html(org.summary)

                $('.agriculture_1 .title').html(org.content1.title)
                $('.agriculture_1 .img-fluid').prop('src', uploaded+''+org.content1.image)
                $('.agriculture_1 .number').html(org.content1.intro)

                $('.agriculture_2 .title').html(org.content2.title)
                $('.agriculture_2 .img-fluid').prop('src', uploaded+''+org.content2.image)
                $('.agriculture_2 .number').html(org.content2.intro)

                $('.agriculture_3 .title').html(org.content3.title)
                $('.agriculture_3 .img-fluid').prop('src', uploaded+''+org.content3.image)
                $('.agriculture_3 .number').html(org.content3.intro)
                

                // 生活模式环境
                var cflr = res.res.cflr;
                $('.session-content.set3').css('background-image', `url(${uploaded}${cflr.backgrounds[0]})`)
                $('.clothes_count').text(cflr.content1.num[0])
                $('.clothes_count_before').text(cflr.content1.num[1])
                $('.clothes_count_after').text(cflr.content1.num[2])
                $('.lang_yifu_0').text(cflr.content1.summary)
                $('.lang_yifu_1').html(cflr.content1.tips[1])
                $('.lang_yifu_2').html(cflr.content1.tips[2])
                $('.lang_yifu_3').html(cflr.content1.tips[3])
                $('.lang_yifu_4').html(cflr.content1.tips[4])
                $('.lang_yifu_5').html(cflr.content1.tips[5])
                $('.lang_yifu_6').html(cflr.content1.tips[6])
                $('.lang_yifu_7').html(cflr.content1.tips[7])
                $('.lang_yifu_8').html(cflr.content1.tips[8])
                $('.lang_yifu_9').html(cflr.content1.tips[9])
                $('.lang_yifu_10').html(cflr.content1.tips[10])
                $('.lang_yifu_11').html(cflr.content1.tips[11])

                $('.food_love').text(cflr.content2.summary)
                $('.food_love_screen').prop('src', `${uploaded}${cflr.content2.images}`)

                $('.lang_woju').text(cflr.content3.summary)
                $('.zhu_screen').prop('src', `${uploaded}${cflr.content3.images}`)
                $('.woju_txt1').html(cflr.content4.tips[0])
                $('.woju_txt2').html(cflr.content4.tips[1])

                $('.lang_qihou').text(cflr.content4.summary)
                $('.qihou_screen').prop('src', `${uploaded}${cflr.content4.images}`)
                $('.lang_txt1').html(cflr.content4.tips[0])
                $('.lang_txt2').html(cflr.content4.tips[1])
                $('.lang_zhu_tip').html( cflr.content4.tips[2])
                
                $(".tablist_envoir").on('click', 'a', function(e) {
                    var current = $(e.target).parent().index();                 
                    console.log(cflr.backgrounds)
                    $('.session-content.set3').css('background-image', `url(${uploaded}${cflr.backgrounds[current]}?version=${current})`)
                })

                var images = cflr.backgrounds;
                for(var i = 0; i < images.length; i++){
                    var img = document.createElement('img');
                    img.style.display = 'none';
                    img.src = uploaded +images[i]
                    document.body.appendChild(img)
                }

                // 粮食危机
                var cri = res.res.produce_crisis;
                console.log(cri)
                var cri_html = ''
                for(var i = 0; i < cri.length; i++){
                    // cri_html += `<div class="text-wrapper" id="content${i}">
                    //                 <div class="clearfix">
                    //                     <div class="margin-b-20">
                    //                         <span class="icon">
                    //                             <img src="images/about/icon_wave2.svg">
                    //                         </span>
                    //                         <span class="lang_yanmo"></span>
                    //                     </div>
                    //                     <span class="pull-left number">${cri[i].percent}
                    //                         <span class="percent">%</span>
                    //                     </span>
                    //                     <span class="pull-left descpt">${cri[i].summary}</span>
                    //                 </div>
                    //             </div>`
                    cri_html += `<div class="text-wrapper" id="content${i+1}">
                                    <div class="clearfix">

                                        <span class="descpt">
                                            ${cri[i].summary}
                                            <span class="number">${cri[i].percent}
                                                <span class="percent">%</span>
                                            </span>
                                        </span>
                                    </div>
                                </div>`
                }
                console.log(cri_html)
                $(".casemap ").append(cri_html)
                $(".section-case1 .text-wrapper").each(function () {
                    $(this).hide(); 
                    if ($(this).attr('id') == 'content1') {
                        $(this).show();
                    }
                });
            }
        }, 'json')
    }

    


});


