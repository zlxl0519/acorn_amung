<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/resources/header.jsp"%><!-- header -->

<div class="content">	
	<h2>QnA</h2>
	<div class="left mb20">
		<h3>문의사항이 있다면 글을 남겨주세요<br/>
		자주 묻는 질문은
		<a href="${pageContext.request.contextPath }/faq/faq_main.do">
			<strong class="f_blue f16"> FaQ</strong>
		</a>
		에서 확인해주요.
		
		</h3>
	</div>
	
	<!-- 검색 폼 -->
	<div class="search-form mt20">
		<form action="qna_list.do" method="get">
			<div class="search-wrap">
	          <label for="condition">검색조건</label>
	          <select name="condition" id="condition">
				  <option value="title_content" <c:if  test="${condition eq 'title_content'  }">selected</c:if>>제목+내용</option>				
	              <option value="title" <c:if  test="${condition eq 'title'  }">selected</c:if>>제목</option>
	              <option value="writer" <c:if  test="${condition eq 'writer'  }">selected</c:if>>작성자</option>
	          </select>
	          <label for="keyword">
	          		<input value="${keyword }" type="text"  name="keyword" placeholder="검색어를 입력하세요"/>
	          		<button type="submit"class="btn-search"><i class="fas fa-search"></i></button>
	          </label>
	         </div>
	     </form>   
     </div>
	
 
	<div class="table-wrap">
			<table>
			<colgroup>
	        	<col width="100px"/>
	        	<col width="50%"/>
	        	<col width=""/>
	       		<col width="200px"/>
	        	<col width="100px"/>
	   		</colgroup>
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="tmp" items="${list }">
						<tr>
							<td>${tmp.num }</td>
							<td class="board_title left"><a href="content.do?num=${tmp.num }">
								${tmp.title } [${tmp.comm}]
								<c:if test="${tmp.done ne 0 }">
									답변 완료
								</c:if>
							</a></td>
							<td>${tmp.writer }</td>
							<td>${tmp.regdate }</td>
							<td>${tmp.hit }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>	
		</div><!-- table-wrap -->
		
		<div class="left mt20">
		 <a href="qna_list.do"><button>전체목록 보기</button></a>
		 <a href="${pageContext.request.contextPath}/qna/private/insertform.do"><button class="btn-out">작성하기</button></a>
			<c:if test="${not empty id }">
				<a href="myqna.do"><button class="btn-out-b">내 글 보기</button></a>
			</c:if>
	  </div><!--left-->
  
    <!-- 페이징 처리 --> 
    <div class="page-display">
          <ul class="pagination pagination-sm">
          <c:if test="${startPageNum ne 1 }">
              <li class="page-item"><a class="page-link"  href="qna_list.do?pageNum=${startPageNum-1  }&condition=${condition }&keyword=${encodedK  }">Prev</a></li>
          </c:if>
          <c:forEach var="i" begin="${startPageNum }"  end="${endPageNum }">
              <c:choose>
                   <c:when test="${i eq pageNum }">
                        <li class="page-item active"><a  class="page-link" href="qna_list.do?pageNum=${i  }&condition=${condition }&keyword=${encodedK }">${i  }</a></li>
                   </c:when>
                   <c:otherwise>
                        <li class="page-item"><a  class="page-link" href="qna_list.do?pageNum=${i  }&condition=${condition }&keyword=${encodedK }">${i  }</a></li>
                   </c:otherwise>
              </c:choose>
          </c:forEach>
          <c:if test="${endPageNum lt totalPageCount }">
              <li class="page-item"><a class="page-link"  href="qna_list.do?pageNum=${endPageNum+1  }&condition=${condition }&keyword=${encodedK  }">Next</a></li>
          </c:if>
          </ul>     
     </div>
     

</div>
<%@include file="/../resources/footer.jsp"%><!-- footer -->