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

 

     
});


