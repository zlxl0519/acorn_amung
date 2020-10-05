<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/resources/header.jsp"%><!-- header -->

<div class="content">	
	<h2>FAQ</h2>
	
	<div class="left">
		<h3>자주 물어보시는 질문들입니다.</h3>
		<p>
			검색해도 나오지 않는 질문이 있으시다면 
			<a href="${pageContext.request.contextPath }/qna/qna_list.do">
			   <strong class="f_blue f16">QnA</strong>
			</a>
			게시판을 찾아주세요.
		</p>
	</div>
	
	
	<!-- 검색 폼 -->
	
	<form action="faq_main.do" method="get">
          <label for="condition">검색조건</label>
          <select name="condition" id="condition">
			  <option value="all" <c:if  test="${condition eq 'all'  }">selected</c:if>>전체 카테고리</option>				
              <option value="room" <c:if  test="${condition eq 'room'  }">selected</c:if>>객실/예약</option>
              <option value="service" <c:if  test="${condition eq 'service'  }">selected</c:if>>시설/서비스</option>
              <option value="cash" <c:if  test="${condition eq 'cash'  }">selected</c:if>>요금/결제</option>
              <option value="etc" <c:if  test="${condition eq 'etc'  }">selected</c:if>>기타</option>
          </select>
          <label for="keyword">
          		<input value="${keyword }" type="text"  name="keyword" placeholder="검색어를 입력하세요"/>
          		<button type="submit"class="btn-search"><i class="fas fa-search"></i></button>
          </label>
     </form>   
	
 
     
	<!-- faq 아코디언형 게시판 부분 -->
	<ul class="accordion-wrap">
		<c:forEach var="tmp" items="${list }">
			<li>
				<div class="accordion-q">
					<div class="q">
						<h6></h6>
					</div>
					<p>
						<c:choose>
							<c:when test="${tmp.category eq 'room' }">객실/예약</c:when>
							<c:when test="${tmp.category eq 'service' }">시설/서비스</c:when>
							<c:when test="${tmp.category eq 'cash' }">요금/결제</c:when>
							<c:when test="${tmp.category eq 'etc' }">기타</c:when>
						</c:choose>
					</p>
					<a href="">${tmp.qst }</a>
				</div>
				<div class="accordion-a">
					<div class="a">
						<h6></h6>
					</div>
					<pre>${tmp.ans }</pre>
				</div>
			</li>
		</c:forEach> 
	</ul>
     
    <!-- 페이징 처리 --> 
    <div class="page-display">
          <ul class="pagination pagination-sm">
          <c:if test="${startPageNum ne 1 }">
              <li class="page-item"><a class="page-link"  href="faq_main.do?pageNum=${startPageNum-1  }&condition=${condition }&keyword=${encodedK  }">Prev</a></li>
          </c:if>
          <c:forEach var="i" begin="${startPageNum }"  end="${endPageNum }">
              <c:choose>
                   <c:when test="${i eq pageNum }">
                        <li class="page-item active"><a  class="page-link" href="faq_main.do?pageNum=${i  }&condition=${condition }&keyword=${encodedK }">${i  }</a></li>
                   </c:when>
                   <c:otherwise>
                        <li class="page-item"><a  class="page-link" href="faq_main.do?pageNum=${i  }&condition=${condition }&keyword=${encodedK }">${i  }</a></li>
                   </c:otherwise>
              </c:choose>
          </c:forEach>
          <c:if test="${endPageNum lt totalPageCount }">
              <li class="page-item"><a class="page-link"  href="faq_main.do?pageNum=${endPageNum+1  }&condition=${condition }&keyword=${encodedK  }">Next</a></li>
          </c:if>
          </ul>     
     </div>
     
     <!-- 관리자 계정일 경우 faq 등록 버튼 노출 -->
     <c:if test="${id eq 'admin'}">
     	<a href="${pageContext.request.contextPath }/faq/faq_insertform.do">
     		<button>새 faq 등록하기</button>
     	</a>
     </c:if>



	<script>
	$(document).ready(function(){
		  $(".accordion-a").hide();
		  $(".accordion-q").click(function(){
		    $(this).next().slideToggle(300);
		    $(".accordion-q").not(this).next().slideUp(300);
		    return false;});
		  $(".accordion-q").eq(0).trigger("click");
		});
	</script>

</div>
<%@include file="/../resources/footer.jsp"%><!-- footer -->