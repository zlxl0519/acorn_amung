<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/../resources/header.jsp"%><!-- header -->
<div class="content">
	<h2>호텔 일상 | 글 작성</h2>
	<div class="table-wrap boardList">
		<form action="upload.do" method="post" enctype="multipart/form-data">
				<table>
					<tbody>
						<tr>
							<th scope="row"><label for="caption">제목</label></th>
							<td>
								<input type="text" name="caption" id="caption" placeholder="제목을 입력해주세요." />
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="subCaption">부제목</label></th>
							<td>
								<input type="text" name="subCaption" id="subCaption" placeholder="부제목을 입력해주세요." />
							</td>
						</tr>
						<tr>
							<th scope="row">
								<label for="image">썸네일</label>
							</th>
							<td class="filebox">
								<input class="upload-name" value="파일선택" disabled="disabled">
								<label for="image">업로드</label> 
								<input type="file" name="image" id="image" class="upload-hidden" accept=".jpg, jpeg, .png, .JPG, .JPEG" />
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
					</tbody>
				</table>
				<div class="left mt20">
					<button type="submit" onclick="submitContents(this);" id="submit">저장</button>
				</div>
				
				
			
		</form>
	</div><!-- form-wrap -->
	

	

</div><!--content -->


<%----------스마트 에디터 script--------------%>
<script src="${pageContext.request.contextPath }/SmartEditor/js/HuskyEZCreator.js"></script>
<script>
	
	$("#submit").on("click", function(){
		if($("#caption").val() == ""){
			alert("제목을 입력해주세요")
			$("#caption").focus();
			return false;
		}
	});
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
		oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);  <%-- id 바꿀거면 여기 content도 바꿔줘야함 --%>
	}
	
	function showHTML() {
		var sHTML = oEditors.getById["content"].getIR();   <%-- id 바꿀거면 여기 content도 바꿔줘야함 --%>
		alert(sHTML); 
	}
	//폼에 저장 버튼을 누르면 호출되는 함수 <button type="submit" onclick="submitContents(this);">저장</button>
	function submitContents(elClickedObj) {
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
		
		// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
		
		try {
			elClickedObj.form.submit(); //폼 강제 제출
		} catch(e) {}
	}
	
	function setDefaultFont() {
		var sDefaultFont = '궁서';
		var nFontSize = 24;
		oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
	}
</script>
<%@include file="/../resources/footer.jsp"%><!-- footer -->