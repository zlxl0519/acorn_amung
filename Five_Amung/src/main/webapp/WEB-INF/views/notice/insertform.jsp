<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/../resources/header.jsp"%><!-- header -->
<script>
	document.title = "Amung'Notice"; 
</script>
<%--공지사항업로드폼 --%>
<div class="content">
<c:choose>
	<c:when test="${id eq 'admin'}">
	<h2>공지사항 작성</h2>
	<div class="table-wrap boardList">
		<form action="insert.do" method="post">
			<table>
				<tr>
					<th>
						<label for="title">제목</label>
					</th>
					<td class="boardList-select">
						<select id="sel" name="category">
							<option value="공지사항">공지사항</option>
							<option value="이벤트">이벤트</option>
						</select>
						<input type="text" name="title" id="title" placeholder="제목을 입력해주세요."/>
					</td>
				</tr>
				<tr>
					<th>
						<label for="content">내용</label>
					</th>
					<td class="smart_content">
						<textarea name="content" id="content" cols="30" rows="10"></textarea>
					</td>
				</tr>
			</table>
			<div class="left mt20"> 
				<button id="submit" type="submit" onclick="submitContents(this);">저장</button>
			</div>
		</form>
	</div><!-- table-wrap -->
	</c:when>
	<c:otherwise>
		<div class="icon-wrap">
			<i class="fas fa-exclamation-circle"></i>
			<p class="form-span m20">
				<strong>관리자만 접근 가능합니다.</strong>
			</p>
			<a href="${pageContext.request.contextPath }/notice/notice_list.jsp" class="btn-default">확인</a>
		</div>
	</c:otherwise>
</c:choose>

</div><!-- content -->
	<script>
	$("#submit").on("click", function(){
		if($("#title").val() == ""){
			alert("제목을 입력해주세요")
			$("#title").focus();
			return false;
		}
	});
	
	</script>

<!-- SmartEditor 에서 필요한 javascript 로딩  -->
<script src="${pageContext.request.contextPath }/SmartEditor/js/HuskyEZCreator.js"></script>
<script>
	var oEditors = [];
	
	//추가 글꼴 목록
	//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];
	
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "content",
		sSkinURI: "${pageContext.request.contextPath}/SmartEditor/SmartEditor2Skin.html",	
		htParams : {
			bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
			fOnBeforeUnload : function(){
				//alert("완료!");
			}
		}, //boolean
		fOnAppLoad : function(){
			//예제 코드
			//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator: "createSEditor2"
	});
	
	function pasteHTML() {
		var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
		oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
	}
	
	function showHTML() {
		var sHTML = oEditors.getById["content"].getIR();
		alert(sHTML);
	}
		
	function submitContents(elClickedObj) {
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
		
		// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
		
		try {
			elClickedObj.form.submit();
		} catch(e) {}
	}
	
	function setDefaultFont() {
		var sDefaultFont = '궁서';
		var nFontSize = 24;
		oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
	}
</script>
<%@include file="/../resources/footer.jsp"%><!-- footer -->