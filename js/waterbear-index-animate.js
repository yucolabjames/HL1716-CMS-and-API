// yU + co
// Move bear function
$(function() {
	$('.hoverArea').on('mouseover', function(e){
		var curZone = $(this).attr('class').replace('hoverArea','').trim();
		var waterBear = $('#animator-water-bear');
		waterBear.removeAttr('class');
		waterBear.addClass(curZone);
	});
	$('.floormap').on('mouseleave', function(e){
		var waterBear = $('#animator-water-bear');
		waterBear.removeAttr('class');
	});
	
});
