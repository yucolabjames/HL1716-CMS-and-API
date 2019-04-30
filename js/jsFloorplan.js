$(function() {
    // INSERT YOUR JAVASCRIPT HERE
   $(window).bind('load resize', function() {



        if($(window).width()>768){

            // 展览馆平面图的展示
            $(".hoverArea.zone1").hover(() => {
                $(".floor-display").hide();
                $(".floor-display.zone1").fadeIn(100);
            },  () => {
                $(".floor-display.zone1").fadeOut(100);
            });

            $(".hoverArea.zone2").hover(() => {
                $(".floor-display").hide();
                $(".floor-display.zone2").fadeIn(100);
            },  () => {
                $(".floor-display.zone2").fadeOut(100);
            });

            $(".hoverArea.zone3").hover(() => {
                $(".floor-display").hide();
                $(".floor-display.zone3").fadeIn(100);
            }, () => {
                $(".floor-display.zone3").fadeOut(100);
            });

            $(".hoverArea.zone4").hover(() => {
                $(".floor-display").hide();
                $(".floor-display.zone4").fadeIn(100);
            },  () => {
                $(".floor-display.zone4").fadeOut(100);
            });

            $(".hoverArea.reception").hover(() => {
                $(".floor-display").hide();
                $(".floor-display.reception").fadeIn(100);
            },  () => {
                $(".floor-display.reception").fadeOut(100);
            });

            $(".hoverArea.workshop").hover(() => {
                $(".floor-display").hide();
                $(".floor-display.workshop").fadeIn(100);
            },  () => {
                $(".floor-display.workshop").fadeOut(100);
            });
        }
    });

    var lang = getLocalStorage('hk_language');
    var language, lan_id;
    if(lang){
        language = lang.lan;
        lan_id = lang.lan_id;
    } else {
        language = 'CHT';
        lan_id = 3;
    }

    api.getBookingIndex({language: lan_id, keys: 'appointment_header,appointment_footer'}).then(res => {
        if(res.error_code == 0){
 
            var header = res.res.data[1];
            console.log('header',header)
            $('.parallax-window').css('background-image', `url(${uploaded +''+ header.image})`)
            $('.lang_load_submit').html(header.content)
            $('.lang_load_booking_visit').html(header.txt)

            // 底部
            var footer = res.res.data[0].content
            var footer_html = '<div class="clearfix">'
            footer.forEach( item => {
                // footer_html += `<div class="col-xs-6 col-sm-4 gallery-item"><div class="text-descpt">${item.text}</div><img src="${uploaded + '' + item.image}" class="img-full"></div>`
                footer_html += `<div class="col-xs-6 col-sm-4 gallery-item"><div class="text-descpt">${item.text}</div><img src="${uploaded + '' + item.image}" class="img-full"></div>`
            })
            console.log('footer', footer)
            $(".session-gallery").html(footer_html+'</div>')
        }
    })
    

    // Live photo
    // api.getBookingIndex({language: lan_id, keys: 'appointment_footer'}).then(res => {
    //     if(res.error_code == 0){
    //         // $('.lang_load_booking_visit').html(res.res.data[1].txt)
    //         // $('.lang_load_submit').html(res.res.data[1].content)
    //         // $('.parallax-window').css('background-image', `url(${uploaded +''+ res.res.data[1].image})`)
    //         // 头图
    //         var header = res.res.data[0];
    //         console.log('footer',header)
    //         $('.parallax-window').css('background-image', `url(${uploaded +''+ header.image})`)
    //         $('.lang_load_submit').html(header.content)
    //         $('.lang_load_booking_visit').html(header.txt)

    //         // 底部
    //         var footer = res.res.data[0].content
    //         var footer_html = ''
    //         footer.forEach( item => {
    //             footer_html += `<div class="col-xs-6 col-sm-4 gallery-item"><div class="text-descpt">${item.text}</div><img src="${uploaded + '' + item.image}" class="img-full"></div>`
    //         })
    //         $("#session-gallery").html(footer_html)
    //     }
    // })

    api.getZone({language: lan_id}).then( res => {
        if(res.error_code == 0){
            var zone = res.res;
            console.log(zone)
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
    })
 

     
});


