package com.five.amung.qna.service;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.five.amung.qna.dao.QnaDao;
import com.five.amung.qna.dto.QnaDto;
import com.five.amung.review.dto.ReviewDto;

@Service
public class QnaServiceImpl implements QnaService {
	@Autowired
	private QnaDao qnaDao;
	
	final int PAGE_ROW_COUNT=10;
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
        //보여줄 페이지 데이터의 시작 ResultSet row 번호
        int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
        //보여줄 페이지 데이터의 끝 ResultSet row 번호
        int endRowNum=pageNum*PAGE_ROW_COUNT;
        /*
           검색 키워드에 관련된 처리 
        */
        String keyword=request.getParameter("keyword"); //검색 키워드
        String condition=request.getParameter("condition"); //검색 조건
        if(keyword==null){//전달된 키워드가 없다면 
           keyword=""; //빈 문자열을 넣어준다. 
           condition="";
        }
        //인코딩된 키워드를 미리 만들어 둔다. 
        String encodedK=URLEncoder.encode(keyword);
        
        //검색 키워드와 startRowNum, endRowNum 을 담을 CafeDto 객체 생성
        QnaDto dto=new QnaDto();
        dto.setStartRowNum(startRowNum);
        dto.setEndRowNum(endRowNum);
        
        if(!keyword.equals("")){ //만일 키워드가 넘어온다면 
           if(condition.equals("title_content")){
              //검색 키워드를 CafeDto 객체의 필드에 담는다. 
              dto.setTitle(keyword);
              dto.setContent(keyword);
           }else if(condition.equals("title")){
              dto.setTitle(keyword);
           }else if(condition.equals("writer")){
              dto.setWriter(keyword);
           }
        }
        //파일 목록 얻어오기
        List<QnaDto> list= qnaDao.getList(dto);
        //전체 row 의 갯수 
        int totalRow=qnaDao.getCount(dto);
        
        //전체 페이지의 갯수 구하기
        int totalPageCount=
              (int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
        //시작 페이지 번호
        int startPageNum=
           1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
        //끝 페이지 번호
        int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
        //끝 페이지 번호가 잘못된 값이라면 
        if(totalPageCount < endPageNum){
           endPageNum=totalPageCount; //보정해준다. 
        }
        
        //EL 에서 사용할 값을 미리 request 에 담아두기
        request.setAttribute("list", list);
        request.setAttribute("startPageNum", startPageNum);
        request.setAttribute("endPageNum", endPageNum);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("totalPageCount", totalPageCount);
        request.setAttribute("condition", condition);
        request.setAttribute("keyword", keyword);
        request.setAttribute("encodedK", encodedK);
	}
	
	@Override
	public void getDetail(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("num"));
		String keyword=request.getParameter("keyword"); //검색 키워드
		String condition=request.getParameter("condition"); //검색 조건
		if(keyword==null) {
			keyword="";
			condition="";
		}
		String encodedK=URLEncoder.encode(keyword);
		
		QnaDto dto = new QnaDto();
		dto.setNum(num);
		
		if(!keyword.equals("")) {
			if(condition.equals("title_content")) {
				dto.setTitle(keyword);
				dto.setContent(keyword);
			}else if(condition.equals("title")) {
				dto.setTitle(keyword);
			}else if(condition.equals("writer")) {
				dto.setWriter(keyword);
			}
		}
		
		QnaDto resultDto = qnaDao.getData(dto);
		
		request.setAttribute("dto", resultDto);
		request.setAttribute("condition", condition);
		request.setAttribute("keyword", keyword);
		request.setAttribute("encodedK", encodedK);
		
		//조회수 올리기
		qnaDao.addHit(num);
	}
	
	@Override
	public void saveContent(QnaDto dto) {
		qnaDao.insert(dto);
	}
	
	@Override
	public void updateContent(QnaDto dto) {
		qnaDao.update(dto);
	}
	
	@Override
	public void deleteContent(int num, HttpServletRequest request) {
		qnaDao.delete(num);
	}

	@Override
	public void getMyList(HttpServletRequest request) {
		//보여줄 페이지의 번호
        int pageNum=1;
        //보여줄 페이지의 번호가 파라미터로 전달되는지 읽어와 본다.   
        String strPageNum=request.getParameter("pageNum");
        if(strPageNum != null){//페이지 번호가 파라미터로 넘어온다면
           //페이지 번호를 설정한다.
           pageNum=Integer.parseInt(strPageNum);
        }
        //보여줄 페이지 데이터의 시작 ResultSet row 번호
        int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
        //보여줄 페이지 데이터의 끝 ResultSet row 번호
        int endRowNum=pageNum*PAGE_ROW_COUNT;
        
		String id=(String)request.getSession().getAttribute("id");

		QnaDto dto = new QnaDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		dto.setWriter(id);
				
		List<QnaDto> list = qnaDao.getMyList(dto);
		int totalRow = qnaDao.getMyCount(dto);
						
		//전체 페이지의 갯수 구하기
        int totalPageCount=
              (int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
        //시작 페이지 번호
        int startPageNum=
           1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
        //끝 페이지 번호
        int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
        //끝 페이지 번호가 잘못된 값이라면 
        if(totalPageCount < endPageNum){
           endPageNum=totalPageCount; //보정해준다. 
        }
			
		//EL에서 사용할 값을 미리 request에 담아두기
		request.setAttribute("list", list);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalPageCount", totalPageCount);	
		request.setAttribute("startPageNum", startPageNum);
	    request.setAttribute("endPageNum", endPageNum);
	}
}
