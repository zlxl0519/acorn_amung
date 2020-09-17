function scrollMenu() {
	window.addEventListener('scroll', function(e) {
		var distanceY = window.pageYOffset || document.documentElement.scrollTop,
			shrinkOn = 100; // 기준점인 y 픽셀. 

		if (distanceY > shrinkOn) { // 줄어든 헤더 버전
			$(".nav1").slideUp();
			$("#nav-slide").slideUp();
			$(".nav2-small").css('display', 'inline-block')
			$(".nav2-small").slideDown();

		} else { // 평소 헤더 버전
			$(".nav1").show();
			$("#nav-slide").show();
			$(".nav2-small").hide();
		}
	});
}
$(document).ready(function() {
	var fileTarget = $('.filebox .upload-hidden');

	fileTarget.on('change', function() {
		if (window.FileReader) {
			var filename = $(this)[0].files[0].name;
		} else {
			var filename = $(this).val().split('/').pop().split('\\').pop();
		}

		$(this).siblings('.upload-name').val(filename);
	});
	
});





	

