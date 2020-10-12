<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약한 강아지 정보</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/base.css">
</head>
<body>
<div class="popup">
	<div class="popup-h">
		<h3>강아지 정보</h3>
	</div>
	<div class="popup-dog">
		<ul>
			<li>
				<h2>
					${dogDto.dname }
				</h2>
			</li>
			<li>
			<strong>반려견 나이</strong>: ${dogDto.dage } 살
			</li>
			<li>
			<strong>견종</strong>: ${dogDto.breed }
			</li>
			<li>
			<strong>몸무게</strong> : 
			<c:choose>
				<c:when test="${dogDto.weight eq '3' }">
							3kg 이하
						</c:when>
				<c:when test="${dogDto.weight eq '6' }">
							4kg~6kg
						</c:when>
				<c:when test="${dogDto.weight eq '9' }">
							7kg~9kg
						</c:when>
				<c:when test="${dogDto.weight eq '10' }">
							10kg 이상
						</c:when>
			</c:choose>
			</li>
			<li>
			<strong>중성화 유무</strong>: 
			<c:choose>
				<c:when test="${dogDto.neutral eq 'yes' }">
					유
				</c:when>
				<c:otherwise>
					무
				</c:otherwise>
			</c:choose>
			</li>
			<li>
			<strong>성별</strong>: 
			<c:choose>
				<c:when test="${dogDto.gender eq 'female' }">
					여아
				</c:when>
				<c:otherwise>
					남아
				</c:otherwise>
			</c:choose>
			</li>
			<li class="dog-etc">
			<strong>특이사항</strong>
			<c:choose>
				<c:when test="${empty dogDto.etc }">
					<pre>특이사항이 없습니다.</pre>
				</c:when>
				<c:otherwise>
					<pre>${dogDto.etc }</pre>
				</c:otherwise>
			</c:choose>
			</li>
		</ul>
	</div>
</div>
</body>
</html>