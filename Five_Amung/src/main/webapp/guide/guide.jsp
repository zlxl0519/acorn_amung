<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../resources/header.jsp"></jsp:include>

<div class="content guide">
<h3 class="review center"><strong>이용안내</strong>  </h3>
	<h4><i class="fas fa-clock"></i>
	<strong>운영시간</strong><br />
	<span>매일 10:30~21:00</span>
	</h4>
		<ul>
			<li>에이멍은 연중 무휴로 운영됩니다.</li>
			<li>독파크를 제외한 모든 서비스는 100% 예약제로 운영됩니다.</li>
			<li>호텔은 사전예약 시 8시부터 입실이 가능합니다.(사전예약 필수)</li>
			<li>사전입실 시 개인 상담이 어려우니 양해해 주시기 바랍니다.</li>
		</ul>
	<h4><i class="fas fa-phone-alt"></i>
	<strong>상담문의</strong><br />
	<span>예약 및 상담시간 08:00 ~ 20:00</span>
	</h4>
		<ul>
			<li>에이멍 1111-2222</li>
		</ul>
	<h4><i class="fas fa-clipboard-list"></i>
	<strong>안내사항</strong><br />
	<span>이용 시 주의사항</span>
	</h4>
		<ul>
			<li>
				1년 이내 5가지 접종(종합, 코로나, 켄넬코프, 신종 인플루엔자, 광견병) 받지 않은  반려견은 입실이 제한됩니다.
				<br>* 접종기록은 접종병원명이 꼭 필요하므로 증빙 자료는 미리 준비해주세요.
			</li>
			<li>
				1살 미만의 반려견인 경우 항체 검사가 필수 입니다.
				<br>(단, 1살 이상 시 재접종 기록 확인)
			</li>
			<li>생리,건강문제 또는 공격성이 강해 타 고객의 이용에 피해가 되는 반려견 일 경우 입실이 제한됩니다.</li>
			<li>
				펫택시 이용 시, 별도의 예약이 필요합니다.
				<br>(* 픽업 서비스 페이지 참고)
			</li>
		</ul>
	<h4><i class="fas fa-map-marker-alt"></i>
		<strong>오시는 길</strong><br />
		<span>에이멍 위치</span>
	</h4>
		<ul>
			<li><i class="far fa-compass"></i>
				서울특별시 강남구 테헤란로 124 삼원타워 (1층 우리은행 건물)
				<br /><b>※ 주차안내 : 평일주차 무료, 주말주차 30분 무료(이후 10분 당 500원)</b>
			</li>
			<li><i class="fas fa-subway"></i>
				지하철 이용 시
				<br />2호선 (강남 1번출구, 역삼 3번출구) , 도보 10분
				<br />신분당선(강남)
			</li>
		</ul>
</div>
<div id="map" style="width:100%;height:400px;"></div>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng( 37.49889085864613, 127.03185970191794), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(37.49889085864613, 127.03185970191794); 

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
    	position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);

	// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
	// marker.setMap(null); 
	
	marker.setTitle('Amung');
	
	
</script>
<jsp:include page="../resources/footer.jsp"></jsp:include>