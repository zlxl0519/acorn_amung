package com.five.amung.notice.service;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.five.amung.notice.dao.NoticeDao;
import com.five.amung.notice.dto.NoticeDto;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDao noticeDao;
	
	//한 페이지에 나타낼 row 의 갯수
	final int PAGE_ROW_COUNT=5;
	//하단 디스플레이 페이지 갯수
	final int PAGE_DISPLAY_COUNT=5;
	
	@Override
	public void getList(HttpServletRequest request) {
		//보여줄 페이지의 번호
	  	int pageNum=1;
	  	//보여줄 페이지의 번호가 파라미터로 전달되는지 읽어와 본다.	
	  	String strPageNum=request.getParameter("pageNum");
	  	if(strPageNum != null){//페이지 번호가 파라미터로 넘어온다면       
	  		//페이지 번호를 설정한다.
	  		pageNum=Integer.parseInt(strPageNum);
	  	}
	  	//보여줄 페이지 데이터의 시작 ResultSet row 번호 (등차수열 an = a1 + (n-1)d ) ///공차수열
	  	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	  	//보여줄 페이지 데이터의 끝 ResultSet row 번호
	  	int endRowNum=pageNum*PAGE_ROW_COUNT;
	  	
	  	/*
			검색 키워드에 돤련된 처리
		*/
		String keyword=request.getParameter("keyword"); //검색키워드
		String condition=request.getParameter("condition"); //검색조건
		
	  	if(keyword==null){
	  		//전달된 키워드가 없다면
	  		keyword="";//빈문자열을 ㅇ넣어준다.
	  		condition="";
	  	}
		//인코딩된 키워드를 미리 만들어 둔다. 
		String encodedK=URLEncoder.encode(keyword);
		
		//검색 키워드와 startRowNum, endRowNum 을 담을 CafeDto 객체 생성
		NoticeDto dto=new NoticeDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);

		
		if(!keyword.equals("")){ //만일 키워드가 넘어온다면 
			if(condition.equals("title_content")){
				//검색 키워드를 NoticeDto 객체의 필드에 담는다.
				dto.setContent(keyword);
				dto.setTitle(keyword);
			}else if(condition.equals("title")){
				dto.setTitle(keyword);
				
			}else if(condition.equals("category")){
				dto.setCategory(keyword);
				
			}
		}
		
		//파일 목록 얻어오기
		List<NoticeDto> list = noticeDao.getList(dto);
		
		//전체 row 의 갯수
		int totalRow=noticeDao.getCount(dto);
		
		//전체 페이지의 갯수 구하기
		//전체 글의  개수 나누기 한페이지 마다 뜰 개수 실수로 캐스팅 하여 나눈 실수값을 정수값으로 올림 = meth.ceil(올림연산)천장 함수
		int totalPageCount=
				(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//시작 페이지 번호 
		//0.몇은 다 영임
		int startPageNum=
			1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		//끝 페이지 번호가 잘못된 값이라면  보정을 해주지 않으면 PAGE_DISPLAY COUNT 의 갯수에 맞춰서 빈 페이지가 들어간다.
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount; //보정해준다. 
		}
		
		String id=(String)request.getSession().getAttribute("id");
		//EL에서 사용할 값을 미리 request에 담아두기
		request.setAttribute("id", id);
		request.setAttribute("list", list);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("condition", condition);
		request.setAttribute("keyword", keyword);
		request.setAttribute("encodedK", encodedK);
	}//==== getList ====

	@Override
	public void getDetail(HttpServletRequest request) {
		//파라미터로 전달되는 글 번호
		int num = Integer.parseInt(request.getParameter("num")); //ref_group 번호
		/*
		검색 키워드에 돤련된 처리
		*/
		String keyword=request.getParameter("keyword"); //검색키워드
		String condition=request.getParameter("condition"); //검색조건
		
	  	if(keyword==null){
	  		//전달된 키워드가 없다면
	  		keyword="";//빈문자열을 넣어준다.
	  		condition="";
	  	}
		//인코딩된 키워드를 미리 만들어 둔다. 
		String encodedK=URLEncoder.encode(keyword);
		
		//글 번호와 검색 키워드를 담을 CafeDto 객체 생성 CafeDto 객체 생성
		NoticeDto dto=new NoticeDto();
		dto.setNum(num);//글번호 담기
		
		if(!keyword.equals("")){ //만일 키워드가 넘어온다면 
			if(condition.equals("title_content")){
				//검색 키워드를 NoticeDto 객체의 필드에 담는다.
				dto.setContent(keyword);
				dto.setTitle(keyword);
			}else if(condition.equals("title")){
				dto.setTitle(keyword);
				
			}else if(condition.equals("category")){
				dto.setCategory(keyword);
			}
		}//if 종료
		
		//자세히 보여줄 글 정보
		NoticeDto resultDto = noticeDao.getData(dto);
		
		//view 페이지 에서 필요한 내용 HttpServletRequest에 담기
		request.setAttribute("dto", resultDto);
		request.setAttribute("condition", condition);
		request.setAttribute("keyword", keyword);
		request.setAttribute("encodedK", encodedK);
		
		//글 조회수 올리기
		noticeDao.addViewCount(num);
		
	}//==== geDetail ====

	@Override
	public void saveContent(NoticeDto dto) {
		noticeDao.insert(dto);
	}//==== saveContent ====

	@Override
	public void updateContent(NoticeDto dto) {
		noticeDao.update(dto);
	}//==== updateContent ====

	@Override
	public void deleteContent(int num, HttpServletRequest request) {
		
		noticeDao.delete(num);
	}//==== deleteContent ====
}//======== NoticeServiceImpl ========