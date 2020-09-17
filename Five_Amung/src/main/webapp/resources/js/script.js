function scrollMenu() {
	window.addEventListener('scroll', function(e) {
		var distanceY = window.pageYOffset || document.documentElement.scrollTop,
			shrinkOn = 100;//y pixel 기준 

		if (distanceY > shrinkOn) {//줄어들었을때 
			$(".nav1").hide();
			$(".nav2")
			.addClass("nav2-small bounce");
		} else {//원상태
			$(".nav1").show();
			$(".nav2")
			.removeClass("nav2-small bounce");
		}
	});
}
//파일 버튼
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