package com.five.amung.gallery.service;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.five.amung.gallery.dao.GalleryCommentDao;
import com.five.amung.gallery.dao.GalleryDao;
import com.five.amung.gallery.dto.GalleryCommentDto;
import com.five.amung.gallery.dto.GalleryDto;


@Service
public class GalleryServiceImpl implements GalleryService{

	@Autowired
	private GalleryDao galleryDao;
	
	@Autowired
	private GalleryCommentDao galleryCommentDao;

	//한 페이지에 나타낼 row 의 갯수
	final int PAGE_ROW_COUNT=6;
	
	@Override
	public void getList(HttpServletRequest request) {
		// TODO 리스트 불러오기
		
		String id = (String)request.getSession().getAttribute("id");
		
		//보여줄 페이지의 번호
		int pageNum=1;
		
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		GalleryDto dto=new GalleryDto();
		//전체 row 의 갯수를 읽어온다.
		int totalRow=galleryDao.getCount(dto);
		//전체 페이지의 갯수 구하기
		int totalPageCount=
		(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		
		// CafeDto 객체에 위에서 계산된 startRowNum 과 endRowNum 을 담는다.
		
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		//1. DB 에서 글 목록을 얻어온다.
		List<GalleryDto> list=galleryDao.getList(dto);
		//2. 글 목록을 응답한다.
		request.setAttribute("list", list);
		//메인에서 사용하기 위함
		request.setAttribute("galleryList", list);
	    request.setAttribute("pageNum", pageNum);
	    request.setAttribute("totalRow", totalRow);
	    request.setAttribute("totalPageCount", totalPageCount);
	}

	
	
	@Override
	public void saveContent(GalleryDto dto, HttpServletRequest request, 
			HttpServletResponse response, MultipartFile mFile) throws IOException {
		// TODO Auto-generated method stub
		
		//원본 파일명
		String orgFileName=mFile.getOriginalFilename();
		// webapp/upload 폴더 까지의 실제 경로(서버의 파일시스템 상에서의 경로)
		String realPath=request.getServletContext().getRealPath("/upload");
		//저장할 파일의 상세 경로
		String filePath=realPath+File.separator;
		//디렉토리를 만들 파일 객체 생성
		File upload=new File(filePath);
		if(!upload.exists()) {//만일 디렉토리가 존재하지 않으면 
			upload.mkdir(); //만들어 준다.
		}
		//저장할 파일 명을 구성한다.
		String saveFileName=
				System.currentTimeMillis()+orgFileName;
		try {
			//upload 폴더에 파일을 저장한다.
			mFile.transferTo(new File(filePath+saveFileName));
			System.out.println(filePath+saveFileName);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		String imagePath = "/upload/"+saveFileName;
		String writer = (String)request.getSession().getAttribute("id");
		dto.setId(writer);
		dto.setImagePath(imagePath);
		galleryDao.insert(dto);
	}
	

	@Override
	public void deleteContent(int num, HttpServletRequest request) {
		// TODO 글 삭제
		galleryDao.delete(num);
		
	}

	@Override
	public void updateContent(GalleryDto dto, HttpServletRequest request, 
			HttpServletResponse response, MultipartFile mFile) {
		// TODO 글 수정
		//원본 파일명
		String orgFileName=mFile.getOriginalFilename();
		// webapp/upload 폴더 까지의 실제 경로(서버의 파일시스템 상에서의 경로)
		String realPath=request.getServletContext().getRealPath("/upload");
		//저장할 파일의 상세 경로
		String filePath=realPath+File.separator;
		//디렉토리를 만들 파일 객체 생성
		File upload=new File(filePath);
		if(!upload.exists()) {//만일 디렉토리가 존재하지 않으면 
			upload.mkdir(); //만들어 준다.
		}
		//저장할 파일 명을 구성한다.
		String saveFileName=
				System.currentTimeMillis()+orgFileName;
		try {
			//upload 폴더에 파일을 저장한다.
			mFile.transferTo(new File(filePath+saveFileName));
			System.out.println(filePath+saveFileName);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		String imagePath = "/upload/"+saveFileName;
		String writer = (String)request.getSession().getAttribute("id");
		dto.setId(writer);
		dto.setImagePath(imagePath);
		galleryDao.update(dto);
		
	}

	@Override
	public void getDetail(HttpServletRequest request) {
		// TODO 상세보기
		int num=Integer.parseInt(request.getParameter("num"));
		galleryDao.viewCount(num);
		GalleryDto resultDto =galleryDao.getData(num);
		request.setAttribute("dto", resultDto);
		
		//===========댓글 페이징 처리==================
	     
	     /* 아래는 댓글 페이징 처리 관련 비즈니스 로직 입니다.*/
			final int PAGE_ROW_COUNT=10;
			final int PAGE_DISPLAY_COUNT=5;
			
			
			//전체 row 의 갯수를 읽어온다. 자세히 보여줄 글의 번호가 ref_group  번호 이다.
			int totalRow=galleryCommentDao.getCount(num);

			//보여줄 페이지의 번호(만일 pageNum 이 넘어오지 않으면 가장 마지막 페이지)
			String strPageNum=request.getParameter("pageNum");
			//전체 페이지의 갯수 구하기
			int totalPageCount= (int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
			//일단 마지막 페이지의 댓글에 목록을 보여주기로 하고
			int pageNum=totalPageCount;
			//만일 페이지 번호가 넘어온다면 (클라이언트가 페이징 넘버 버튼을 눌러야만 페이지 번호가 넘어옴 안누르면 null)
			if(strPageNum!=null) {
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
			GalleryCommentDto commentDto=new GalleryCommentDto();
			commentDto.setStartRowNum(startRowNum);
			commentDto.setEndRowNum(endRowNum);
			//ref_group 번호도 담는다.
			commentDto.setRef_group(num);
			
			//DB 에서 댓글 목록을 얻어온다.
			List<GalleryCommentDto> commentList=galleryCommentDao.getList(commentDto);
			//request 에 담아준다.
			request.setAttribute("commentList", commentList);
			request.setAttribute("totalPageCount", totalPageCount);
			request.setAttribute("startPageNum", startPageNum);
			request.setAttribute("endPageNum", endPageNum);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("totalRow", totalRow);
	}



	@Override
	public void getAjaxList(int pageNum, HttpServletRequest request) {
		// TODO 페이징
		
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		//전체 row 의 갯수를 읽어온다.
		GalleryDto dto=new GalleryDto();
		int totalRow=galleryDao.getCount(dto);
		//전체 페이지의 갯수 구하기
		int totalPageCount=
			(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		
		// CafeDto 객체에 위에서 계산된 startRowNum 과 endRowNum 을 담는다.
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		//1. DB 에서 글 목록을 얻어온다.
		List<GalleryDto> list=galleryDao.getList(dto);
		request.setAttribute("list", list);
		//2. 글 목록을 응답한다.
	}

	//===============================운영자===============================================

	@Override
	public void getAdminList(HttpServletRequest request) {
		// TODO 어드민용 리스트
		
		String id = (String)request.getSession().getAttribute("id");
		
		//보여줄 페이지의 번호
		int pageNum=1;
		
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;

		//=============검색 키워드에 관련된 처리================
		
	     String keyword=request.getParameter("keyword"); //검색 키워드
	     if(keyword==null){//전달된 키워드가 없다면 
	        keyword=""; //빈 문자열을 넣어준다. 
	     }
	     //인코딩된 키워드를 미리 만들어 둔다. 
	     String encodedK=URLEncoder.encode(keyword);		

	 	//===========dao, dto 생성해서 데이터 set ============================
		GalleryDto dto=new GalleryDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		//===========키워드 처리================================
		
		if(!keyword.equals("")){ //만일 키워드가 넘어온다면 
			dto.setCaption(keyword);
		}//없을 땐??
		
		
		//전체 row 의 갯수를 읽어온다.
		int totalRow=galleryDao.getCount(dto);
		//전체 페이지의 갯수 구하기
		int totalPageCount=
		(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		
		//1. DB 에서 글 목록을 얻어온다.
		List<GalleryDto> list=galleryDao.getList(dto);
		//2. 글 목록을 응답한다.
		request.setAttribute("list", list);
	    request.setAttribute("pageNum", pageNum);
	    request.setAttribute("totalRow", totalRow);
	    request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("keyword", keyword);
		request.setAttribute("encodedK", encodedK);
	}



	@Override
	public void getAjaxAdminList(int pageNum, HttpServletRequest request) {
		// TODO 페이징 처리 메서드

		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;

		//=============검색 키워드에 관련된 처리================
		
	     String keyword=request.getParameter("keyword"); //검색 키워드
	     if(keyword==null){//전달된 키워드가 없다면 
	        keyword=""; //빈 문자열을 넣어준다. 
	     }
	     //인코딩된 키워드를 미리 만들어 둔다. 
	     String encodedK=URLEncoder.encode(keyword);		

	 	//===========dao, dto 생성해서 데이터 set ============================
		GalleryDto dto=new GalleryDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		//===========키워드 처리================================
		
		if(!keyword.equals("")){ //만일 키워드가 넘어온다면 
			dto.setCaption(keyword);
		}//없을 땐??
		
		
		//전체 row 의 갯수를 읽어온다.
		int totalRow=galleryDao.getCount(dto);
		//전체 페이지의 갯수 구하기
		int totalPageCount=
		(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		
		//1. DB 에서 글 목록을 얻어온다.
		List<GalleryDto> list=galleryDao.getList(dto);
		//2. 글 목록을 응답한다.
		request.setAttribute("list", list);
	    request.setAttribute("pageNum", pageNum);
	    request.setAttribute("totalRow", totalRow);
	    request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("keyword", keyword);
		request.setAttribute("encodedK", encodedK);
	}



	@Override
	public void saveComment(HttpServletRequest request) {
		// TODO 댓글 저장
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
		int seq=galleryCommentDao.getSequence();

		//저장할 댓글 정보를 dto 에 담기
		GalleryCommentDto dto=new GalleryCommentDto();
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
		galleryCommentDao.insert(dto);
		
	}



	@Override
	public void deleteComment(HttpServletRequest request) {
		// TODO 댓글 삭제
		//get 방식 파라미터로 전달되는 삭제할 댓글 번호
		int num=Integer.parseInt(request.getParameter("num"));
		//세션에 저장된 로그인된 아이디
		String id = (String) request.getSession().getAttribute("id");
		//댓글의 정보를 얻어와서 댓글의 작성자와 같은지 비교한다.
		String writer = galleryCommentDao.getData(num).getWriter();
		galleryCommentDao.delete(num);		
	}



	@Override
	public void updateComment(GalleryCommentDto dto) {
		// TODO 댓글 수정
		galleryCommentDao.update(dto);
		
	}



	@Override
	public void moreCommentList(HttpServletRequest request) {
		// TODO 대댓글 불러오기
		//파라미터로 전달된 pageNum 과 ref_group 번호를 읽어온다. 
		int pageNum=Integer.parseInt(request.getParameter("pageNum"));
		int ref_group=Integer.parseInt(request.getParameter("ref_group"));
		
		GalleryDto dto=galleryDao.getData(ref_group);
		request.setAttribute("dto", dto);
		
		/* 아래는 댓글 페이징 처리 관련 비즈니스 로직 입니다.*/
		final int PAGE_ROW_COUNT=5;
		
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		//전체 row 의 갯수를 읽어온다.
		//자세히 보여줄 글의 번호가 ref_group  번호 이다. 
		int totalRow=galleryCommentDao.getCount(ref_group);
		//전체 페이지의 갯수 구하기
		int totalPageCount=
				(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		
		// CafeCommentDto 객체에 위에서 계산된 startRowNum 과 endRowNum 을 담는다.
		GalleryCommentDto commentDto=new GalleryCommentDto();
		commentDto.setStartRowNum(startRowNum);
		commentDto.setEndRowNum(endRowNum);
		//ref_group 번호도 담는다.
		commentDto.setRef_group(ref_group);
		
		//DB 에서 댓글 목록을 얻어온다.
		List<GalleryCommentDto> commentList=galleryCommentDao.getList(commentDto);
		//request 에 담아준다.
		request.setAttribute("commentList", commentList);
		request.setAttribute("totalPageCount", totalPageCount);		
		
	}


	
	
}
