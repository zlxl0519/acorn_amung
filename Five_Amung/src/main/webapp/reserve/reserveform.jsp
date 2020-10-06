<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form action="reserve.do" method="post">

	<p>*예약하실 룸을 먼저 선택해주세요.</p>
	<ul class="room_check">
		<li>
			<span class="room-cover"></span>
			<img src="http://www.bowraum.com/images/v6/services/01_hotel/A1.jpg" />
			<div class="room-radio">
				<input
					data-ng-change="isChecked('room')"
					data-ng-model="reserveData.room_name"
					type="radio" 
					value="standard"
					name="room_name"
					id="standard"
					/>
				<label for="standard">d</label>
			</div>
		</li>
		<li>
			<span class="room-cover"></span>
			<img src="http://www.bowraum.com/images/v6/services/01_hotel/A2.jpg" />
			<div class="room-radio">
				<input 
					data-ng-change="isChecked('room')"
					data-ng-model="reserveData.room_name"
					type="radio" 
					value="deluxe"
					name="room_name"
					id="deluxe"
					/>
				<label for="deluxe">d</label>
			</div>
			
		</li>
		<li>
			<span class="room-cover"></span>
			<img src="http://www.bowraum.com/images/v6/services/01_hotel/A3.jpg" />
			<div class="room-radio">
				<input 
					data-ng-change="isChecked('room')"
					data-ng-model="reserveData.room_name"
					type="radio" 
					value="premium"
					name="room_name"
					id="premium"
					/>
				<label for="premium">d</label>
			</div>
		</li>
		
		
	</ul>
	
	<dl>
		<dt>숙박기간</dt>
		<dd>
			<input data-ng-change="isChecked('checkin')" data-ng-model="reserveData.checkin_date" 
				type="text" name="checkin_date" id="checkin" placeholder="입실" 
				onfocus="this.placeholder=''" onblur="this.placeholder='YYYY/MM/DD'"/>
		</dd>
		<dd>
			<input data-ng-change="isChecked('checkout')" data-ng-model="reserveData.checkout_date" 
				type="text" name="checkout_date" id="checkout" placeholder="퇴실" 
				onfocus="this.placeholder=''" onblur="this.placeholder='YYYY/MM/DD'" />
		</dd>
	</dl>
	<dl>
		<dt>입실시간</dt>
		<dd>
			<select data-ng-model="reserveData.start_time" name="start_time" id="start_time">
				<option value="">[옵션]시간을 선택해주세요.</option>
				<option value="10">10시</option>
				<option value="11">11시</option>
				<option value="12">12시</option>
				<option value="13">13시</option>
				<option value="14">14시</option>
				<option value="15">15시</option>
				<option value="16">16시</option>
				<option value="17">17시</option>
				<option value="18">18시</option>
				<option value="19">19시</option>
				<option value="20">20시</option>
				<option value="21">21시</option>
			</select>
		</dd>
	</dl>
	<dl>
		<dt>퇴실시간</dt>
		<dd>
			<select data-ng-model="reserveData.end_time" name="end_time" id="end_time">
				<option value="">[옵션]시간을 선택해주세요.</option>
				<option value="10">10시</option>
				<option value="11">11시</option>
				<option value="12">12시</option>
				<option value="13">13시</option>
				<option value="14">14시</option>
				<option value="15">15시</option>
				<option value="16">16시</option>
				<option value="17">17시</option>
				<option value="18">18시</option>
				<option value="19">19시</option>
				<option value="20">20시</option>
				<option value="21">21시</option>
			</select>
		</dd>
	</dl>
	<table>
		<tr>
			<th>투숙기간</th>
			<td data-ng-show="showed">[  {{ term }} 일 ] {{reserveData.checkin_date}}~{{reserveData.checkout_date}}</td>
		</tr>
		<th>투숙 강아지 선택</th>
		<tr data-ng-repeat="tmp in dogList">
			<td>
				{{tmp.dname}}
				<input data-ng-change="isChecked('dog')" 
					data-ng-model="reserveData.dog_num" type="radio" name="dog_num" value="{{tmp.num}}" />
			</td>
		</tr>
		<tr>
			<th>총 금액</th>
			<td><input type="hidden" name="room_price" value="{{price}}" />{{price}}원</td>
		</tr>
		<p>
			결제는 계좌이체로 부탁드립니다.(예약명과 계좌이름이 동일해야 합니다.)
			홍길동 우리은행 xxxx-xxx-xxxx	
		</p>
		<tr>
			<th>예약자명</th>
			<td>
				<input type="text" name="name" id="name"/>
			</td>
		</tr>
		<tr>
			<th>휴대폰 번호</th>
			<td>
				<input type="text" name="phone" id="phone" />
			</td>
		</tr>
	</table>
	
	<button type="submit">예약하기</button>
</form>


<script>
	//연락처 입력칸에 번호만 입력되도록한다. 
	$("#phone2").on("keyup", function(){
		$(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	
		
	//반려견이름, 반려견종, 반려견나이, 체크인, 체크아웃 입력 안했을시 폼전송 막기
	$("#reserveForm").on("submit", function(){
		if($("#dogName").val()==""){
			alert("반려견 이름을 입력해주세요");
			$("#dogName").focus();
			return false;
		
		}else if($("#dogBreed").val()==""){
			alert("반려견종을 입력해주세요");
			$("#dogBreed").focus();
			return false;
		
		}else if($("#dogAge").val()==""){
			alert("반려견 나이를 입력해주세요");
			$("#dogAge").focus();
			return false;
		
		}else if($("#checkin").val()==""){
			alert("체크인 날짜를 입력해주세요");
			$("#checkin").focus();
			return false;
		
		}else if($("#checkout").val()==""){
			alert("체크아웃 날짜를 입력해주세요");
			$("#checkout").focus();
			return false;
		}
	});

	$(function(){
		$("#checkin").datepicker({
			minDate:0, //오늘포함한 이후 날짜만 활성화
			dateFormat: 'yy-mm-dd',//yyyy-mm-dd 모양으로 바꿈
			dayNamesMin:['일','월','화','수','목','금','토'],//달력의 요일 부분 텍스트
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			changeYear:true, // 달력 년도 select 박스로 선택하게 하기
			changeMonth:true, // 달력 월 select 박스로 선택하게 하기
			showOn:"both", //버튼클릭하거나 포커스가 가면 달력이 나온다.
			buttonImage:"${pageContext.request.contextPath }/resources/img/icon_cal.png",
			buttonImageOnly:true,
			buttonText:"날짜 선택",
			onClose: function(selectedDate){
				//체크인 datepicker 가 닫힐때
				//체크아웃의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
				$("#checkout").datepicker("option", "minDate", selectedDate);
			}
		});
		
		$("#checkout").datepicker({
			minDate:0, //오늘포함한 이후 날짜만 활성화
			dateFormat: 'yy-mm-dd',//yyyy-mm-dd 모양으로 바꿈
			dayNamesMin:['일','월','화','수','목','금','토'],//달력의 요일 부분 텍스트
			monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			changeYear:true, // 달력 년도 select 박스로 선택하게 하기
			changeMonth:true, // 달력 월 select 박스로 선택하게 하기
			showOn:"both", //버튼클릭하거나 포커스가 가면 달력이 나온다.
			buttonImage:"${pageContext.request.contextPath }/resources/img/icon_cal.png",
			buttonImageOnly:true,
			buttonText:"날짜 선택"	,
			onClose: function(selectedDate){
				//체크아웃 datepicker 가 닫힐때
				//체크인 의 선택할수 있는 최대 날짜(maxDate)를 선택한 시작일로 지정
				$("#checkin").datepicker("option","maxDate",selectedDate);
			}
		});
		

	});
	
</script>
