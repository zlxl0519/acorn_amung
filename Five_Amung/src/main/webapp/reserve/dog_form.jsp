<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<p>강아지 정보</p>
<form data-ng-submit="send()">
	<div class="form-ul-wrap">
	<ul>
		<li>
			<label for="dname">이름</label>
			<input data-ng-model="dogData.dname" type="text" name="dname" id="dname" placeholder="반려견의 이름을 작성해주세요" />
		</li>
		<li>
			<label for="dage">나이</label>
			<input data-ng-model="dogData.dage" type="number" name="dage" id="dage" value="0"/><span>&nbsp;살</span>
		</li>
		<li>
			<label for="breed">견종</label>
			<input data-ng-model="dogData.breed" type="text" name="breed" id="breed" placeholder="견종을 작성해주세요"/>
		</li>
		<li>
			<fieldset>
				<legend>몸무게</legend>
				<input data-ng-model="dogData.weight"  type="radio" name="weight" value="3" />3kg 이하
				<input data-ng-model="dogData.weight" type="radio" name="weight" value="6" />4kg~6kg
				<input data-ng-model="dogData.weight" type="radio" name="weight" value="9" />7kg~9kg
				<input data-ng-model="dogData.weight" type="radio" name="weight" value="10" />10kg~
			</fieldset>
		</li>
		<li>
			<fieldset>
				<legend>중성화 유무</legend>
				<input data-ng-model="dogData.neutral" type="radio" name="neutral" value="yes" checked/> 유
				<input data-ng-model="dogData.neutral" type="radio" name="neutral" value="no" /> 무
			</fieldset>	
		</li>
		<li>
		
		<fieldset>
			<legend>성별선택</legend>
			<input data-ng-model="dogData.gender" type="radio" name="gender" value="male" checked/> 남아
			<input data-ng-model="dogData.gender" type="radio" name="gender" value="female" /> 여아
		</fieldset>
		</li>
		<li>
			<label for="etc">기타사항</label>
			<textarea data-ng-model="dogData.etc" name="etc" id="etc" cols="60" rows="10" placeholder="반려견 호텔링 시, 요청사항이나 주의해야하는 사항을 적어주세요"></textarea>
		</li>
	</ul>
	</div>
	<p>* 강아지 정보를 꼭 저장해주세요!!</p>
	<button type="submit">강아지 정보 저장</button>
</form>