// yU + co
// Toggle discount code function
$(function() {
	$('.discount-question .link').on('click', function(){
		var discountSection = $('.discount-section');
		if(discountSection.hasClass('show')){
			discountSection.removeClass('show');
			
			$('.discount-question .cancel').removeClass('show');
			$('.discount-question .question').removeClass('hide');
			$('.discount-section .input-number.discount').val(''); //Empty discount field
		}else{
			discountSection.addClass('show');
			$('.discount-question .cancel').addClass('show');
			$('.discount-question .question').addClass('hide');
		}
	});
});