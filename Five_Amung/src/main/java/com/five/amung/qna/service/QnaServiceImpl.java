package com.five.amung.qna.service;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.five.amung.qna.dao.QnaCommentDao;
import com.five.amung.qna.dao.QnaDao;
import com.five.amung.qna.dto.QnaCommentDto;
import com.five.amung.qna.dto.QnaDto;
import com.five.amung.review.dto.ReviewDto;

@Service
public class QnaServiceImpl implements QnaService {
	@Autowired
	private QnaDao qnaDao;
	@Autowired
	private QnaCommentDao qnaCommentDao;
	
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
        
        //검색 키워드와 startRowNum, endRowNum 을 담을 QnaDto 객체 생성
        QnaDto dto=new QnaDto();
        dto.setStartRowNum(startRowNum);
        dto.setEndRowNum(endRowNum);
        
        if(!keyword.equals("")){ //만일 키워드가 넘어온다면 
           if(condition.equals("title_content")){
              //검색 키워드를 QnaDto 객체의 필드에 담는다. 
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
		
		/* 댓글 페이징*/
		final int PAGE_ROW_COUNT=5;
		final int PAGE_DISPLAY_COUNT=5;
		
		//전체 row 의 갯수를 읽어온다.
		//자세히 보여줄 글의 번호가 ref_group  번호 이다. 
		int totalRow=qnaCommentDao.getCount(num);

		//보여줄 페이지의 번호(만일 pageNum 이 넘어오지 않으면 가장 마지막 페이지)
		String strPageNum=request.getParameter("pageNum");
		//전체 페이지의 갯수 구하기
		int totalPageCount=
						(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//일단 마지막 페이지의 댓글 목록을 보여주기로 하고 
		int pageNum=totalPageCount;
		//만일 페이지 번호가 넘어온다면
		if(strPageNum!=null) {
			//넘어온 페이지에 해당하는 댓글 목록을 보여주도록 한다. 
			pageNum=Integer.parseInt(strPageNum);
		}
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		
		//시작 페이지 번호
		int startPageNum=
			1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		//끝 페이지 번호가 잘못된 값이라면 
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount; //보정해준다. 
		}
		
		// CafeCommentDto 객체에 위에서 계산된 startRowNum 과 endRowNum 을 담는다.
		QnaCommentDto commentDto=new QnaCommentDto();
		commentDto.setStartRowNum(startRowNum);
		commentDto.setEndRowNum(endRowNum);
		//ref_group 번호도 담는다.
		commentDto.setRef_group(num);
		
		//DB 에서 댓글 목록을 얻어온다.
		List<QnaCommentDto> commentList=qnaCommentDao.getList(commentDto);
		//request 에 담아준다.
		request.setAttribute("commentList", commentList);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("pageNum", pageNum);
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

	@Override
	public void saveComment(HttpServletRequest request) {
		//댓글 작성자
		String writer=(String)request.getSession().getAttribute("id");
		
		//폼 전송되는 댓글의 정보 얻어내기
		int ref_group=Integer.parseInt(request.getParameter("ref_group"));
		String target_id=request.getParameter("target_id");
		String content=request.getParameter("content");
		/*
		 *  원글의 댓글은 comment_group 번호가 전송이 안되고
		 *  댓글의 댓글은 comment_group 번호가 전송이 된다.
		 *  따라서 null 여부를 조사하면 원글의 댓글인지 댓글의 댓글인지 판단할수 있다. 
		 */
		String comment_group=request.getParameter("comment_group");
		//새 댓글의 글번호는 dao 를 이용해서 미리 얻어낸다. 
		int seq=qnaCommentDao.getSequence();
		
		//저장할 댓글 정보를 dto 에 담기
		QnaCommentDto dto=new QnaCommentDto();
		dto.setNum(seq);
		dto.setWriter(writer);
		dto.setTarget_id(target_id);
		dto.setContent(content);
		dto.setRef_group(ref_group);
		if(comment_group==null) {//원글의 댓글인 경우 
			//댓글의 글번호가 comment_group 번호가 된다. 
			dto.setComment_group(seq);
		}else {//댓글의 댓글인 경우 
			//폼 전송된 comment_group 번호를 숫자로 바꿔서 dto 에 넣어준다.
			dto.setComment_group(Integer.parseInt(comment_group));
		}
		//댓글 정보를 DB 에 저장한다.
		qnaCommentDao.insert(dto);
		
		//댓글 수 늘이기
		qnaCommentDao.addComment(dto);
	}

	@Override
	public void deleteComment(HttpServletRequest request) {
		//GET 방식 파라미터로 전달되는 삭제할 댓글 번호 
		int num=Integer.parseInt(request.getParameter("num"));
		
		//원글 번호 가져오기
		QnaCommentDto dto=qnaCommentDao.getData(num);
		int orgnum = dto.getRef_group();
		
		//삭제하기
		qnaCommentDao.delete(num);
		
		//댓글 수 줄이기
		qnaCommentDao.reduceComment(orgnum);
	}

	@Override
	public void updateComment(QnaCommentDto dto) {
		qnaCommentDao.update(dto);
	}

	@Override
	public void moreCommentList(HttpServletRequest request) {
		//파라미터로 전달된 pageNum 과 ref_group 번호를 읽어온다. 
		int pageNum=Integer.parseInt(request.getParameter("pageNum"));
		int ref_group=Integer.parseInt(request.getParameter("ref_group"));
		
		QnaDto dto=qnaDao.getData(ref_group);
		request.setAttribute("dto", dto);
		
		/* 아래는 댓글 페이징 처리 관련 비즈니스 로직 입니다.*/
		final int PAGE_ROW_COUNT=5;
		
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		//전체 row 의 갯수를 읽어온다.
		//자세히 보여줄 글의 번호가 ref_group  번호 이다. 
		int totalRow=qnaCommentDao.getCount(ref_group);
		//전체 페이지의 갯수 구하기
		int totalPageCount=
				(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		
		// QnaCommentDto 객체에 위에서 계산된 startRowNum 과 endRowNum 을 담는다.
		QnaCommentDto commentDto=new QnaCommentDto();
		commentDto.setStartRowNum(startRowNum);
		commentDto.setEndRowNum(endRowNum);
		//ref_group 번호도 담는다.
		commentDto.setRef_group(ref_group);
		
		//DB 에서 댓글 목록을 얻어온다.
		List<QnaCommentDto> commentList=qnaCommentDao.getList(commentDto);
		//request 에 담아준다.
		request.setAttribute("commentList", commentList);
		request.setAttribute("totalPageCount", totalPageCount);	
	}

}
