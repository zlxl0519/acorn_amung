<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="No-Cache" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AMung</title>
<!--css-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/base.css">
<!-- fontAwesome -->
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.13.0/css/all.css" />
	  
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/resources/img/favicon.ico">
<link rel="icon" href="myicon.ico" type="image/x-icon">
	  
<!-- IE9 이전 버전 / 로컬에서는 실행되지 않음-->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<!-- //IE9 이전 버전-->
<!--script -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/angular.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/angular-route.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/script.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1cdd137b0b885c589d0ff1e9d01738a4"></script>
<!-- jquery ui datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
</head>

<body onload="javascript:scrollMenu();">
	<div id="wrap">
		<div class="floatmenu">
			<ul>
				<li>
					<a href="https://open.kakao.com/o/sgJwcaxc" target="_blank">
						<i class="fas fa-phone-alt"></i>
						<span>전화연결</span>
					</a>
				</li>
				<li>
					<a href="https://open.kakao.com/o/sgJwcaxc" target="_blank">
						<img src="${pageContext.request.contextPath }/resources/img/icon_talk.png">
						<span>카카오톡</span>
					</a>
				</li>
				<li>
					<a href="#">
						<img src="${pageContext.request.contextPath }/resources/img/icon_up.png">
						<span>올라가기</span>
					</a>
				</li>
			</ul>
		</div>
		<header>
			<nav class="nav1">
				<div class="nav-gnb">
					<ul>
           <c:choose>
							<c:when test="${empty sessionScope.id }">
						    <li>
							    <a href="${pageContext.request.contextPath }/users/loginform.do">
								    로그인
							    </a>
						    </li>
						    <li>
							    <a href="${pageContext.request.contextPath }/users/signup_form.do">
								   회원가입
							    </a>
						    </li>
              </c:when>
              <c:otherwise>
								<li>
                  <a>
                    <span>${id } </span> 님 환영합니다.
                  </a>
                </li>
								<li>
                  <a href="${pageContext.request.contextPath }/mypage/private/info.do">
                    마이페이지
                  </a>
                </li>
								<li>
                  <a href="${pageContext.request.contextPath }/users/logout.do">
                    로그아웃
                  </a>
                </li>
								<li>
                  <a href="${pageContext.request.contextPath }/admin/list.do">
                    <i class="fas fa-cog"></i>
                    운영관리
                  </a>
                </li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div><!-- nav-gnb -->
			</nav><!-- nav1 -->
			<nav id="nav-slide" class="nav2">
				<div>
					<h1>
						<a href="${pageContext.request.contextPath }/">
							<img
								src="${pageContext.request.contextPath }/resources/img/logo_top.png"
								alt="애견 호텔링 전문 : AMung" />
						</a>
					</h1>
					<div class="nav2-gnb">
						<ul>
							<li>
								<a href="${pageContext.request.contextPath }/notice/list.do">
									공지사항
								</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath	}/reserve/reserve_home.do">
									예약하기
								</a>
							</li>
							<li class="gnb-drop">
								<a href="#">
									이용안내
								</a>
								<ul class="dropdown">
									<li>
										<a href="${pageContext.request.contextPath }/guide/guide.do">
											Amung이용안내
										</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath }/guide/service.do">
											AMung주요서비스
										</a>
									</li> 
								</ul>
							</li>
							<li class="gnb-drop"><a href="#">커뮤니티</a>
								<ul class="dropdown">
									<li>
										<a href="${pageContext.request.contextPath }/gallery/list.do">
											AMung의 일상
										</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath }/review/rev_list.do">
											AMung 사용후기
										</a>
									</li> 
									<li>
										<a href="${pageContext.request.contextPath }/qna/qna_list.do">
											QnA게시판
										</a>
									</li>
								</ul>
							</li>
							<li>
								<a href="${pageContext.request.contextPath }/faq/faq_main.do">
									FAQ
								</a>
							</li>
						</ul>
					</div><!-- nav2-gnb -->
				</div><!-- div -->
			</nav><!-- nav-slide -->
		</header>
<script type="text/javascript">
	$(".gnb-drop").hover(function(){
		$(this).find("ul").stop().fadeToggle(300);
	});
</script>