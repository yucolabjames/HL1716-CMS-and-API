$(function () {
    // INSERT YOUR JAVASCRIPT HERE
    $(window).bind('load resize', loadResize);

    function loadResize() {

        $(".section-profileCon").backstretch({
            alignY: 0,
            url: 'images/profile/profileBg_star.jpg',
            //alignX: 0,
            //url:"images/profile/profileBg.jpg".
        });


        $(".widget-option li.active a").parents(".dropdown").find('dLabel').val($(this).data('value'));

    }


    function fancebox() {
        $("[data-fancybox]").fancybox({
            toolbar: false,
            btnTpl: {

                // Arrows
                arrowLeft:
                    '<a data-fancybox-prev class="hide fancybox-button fancybox-button--arrow_left" title="{{PREV}}" href="javascript:;">' +
                    '<svg viewBox="0 0 40 40">' +
                    '<path d="M18,12 L10,20 L18,28 M10,20 L30,20"></path>' +
                    "</svg>" +
                    "</a>",

                arrowRight:
                    '<a data-fancybox-next class="hide fancybox-button fancybox-button--arrow_right" title="{{NEXT}}" href="javascript:;">' +
                    '<svg viewBox="0 0 40 40">' +
                    '<path d="M10,20 L30,20 M22,12 L30,20 L22,28"></path>' +
                    "</svg>" +
                    "</a>"
            },
        });
    }

    var timer = setInterval(function(){
        if(lang){
          init(lang)
        } 
    }, 300);

    function init(langPack) {
        clearInterval(timer)
        $('.animsition').animsition({
            inDuration: 500,
        });
        var lang = getLocalStorage('hk_language');
        var language, lan_id;
        if (lang) {
            language = lang.lan;
            lan_id = lang.lan_id;
        } else {
            language = 'CHT';
            lan_id = 3;
        }

        new Vue({
            el: '#vue_app',
            data: {
                lang: langPack,
                language,
                user: {},
                Habitats: [],
                Habitats_types: [],
                foods: [],
                products: [],
                fittingmirror: {}
            },
            mounted() {
                this.init();
                this.user = JSON.parse(sessionStorage.getItem('login'))
            },
            methods: {

                init() {
                    

                    var valid = false;
                    var config;

                    this.language = language == 'CHT' ? 'ZH' :
                        language == 'CHS' ? 'CN' :
                            language == 'ENG' ? 'EN' : 'zh'

                    getToken().then(res => {
                        valid = true; config = res;
                        this.config = config;
                        this.getVirtualHabitat();
                        this.getFittingmirror();
                        api.me.me({ lang: language, auth: config.token }).then(res => {
                            console.log(res)
                        })
                    })
                },
                getFittingmirror() {
                    api.fittingmirror.user_score({ lang: this.language, auth: this.config.token }).then(res => {
                        this.fittingmirror = res;
                    })
                },
                // 获取新鲜食品与日常用品
                getVirtualHabitat() {
                    api.shopping_game.user_bought_list({ lang: this.language, auth: this.config.token }).then(res => {
                        // filters
                        this.foods = res.filter(item => item.category == 'food')

                        this.products = res.filter(item => item.category == 'product')


                        this.Habitats = res;
                        setTimeout(() => {
                            $(".section-profileCon").backstretch({
                                alignY: 0,
                                url: 'images/profile/profileBg_star.jpg',
                            });
                            $('.slider-shop').slick({
                                slidesToShow: 5,
                                slidesToScroll: 1,
                                dots: false,
                                responsive: [
                                    {
                                        breakpoint: 1024,
                                        settings: {
                                            slidesToShow: 4,
                                            slidesToScroll: 1,
                                        }
                                    },
                                    {
                                        breakpoint: 600,
                                        settings: {
                                            slidesToShow: 2,
                                            slidesToScroll: 1
                                        }
                                    }
                                ]

                            });
                        }, 100)

                    }).catch((xhr, err) => {
                        if (xhr.status == 401) {
                            location.href = 'memberLogin.html?lang=' + language
                        }
                    })
                },


            }
        })
    }
});


