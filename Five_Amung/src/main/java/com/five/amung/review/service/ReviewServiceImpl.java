package com.five.amung.review.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.five.amung.review.dao.ReviewDao;
import com.five.amung.review.dto.ReviewDto;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDao reviewDao;
	
	//한 페이지에 나타낼 row의 갯수
	final int PAGE_ROW_COUNT=5;
	
	@Override
	public void getList(HttpServletRequest request) {
		int pageNum=1;
		
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		ReviewDto dto = new ReviewDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		List<ReviewDto> list = reviewDao.getList(dto);
		int totalRow = reviewDao.getCount(dto);
		
		int totalPageCount=
				(int) Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		
	    //EL에서 사용할 값을 미리 request에 담아두기
	    request.setAttribute("list", list);
	    request.setAttribute("pageNum", pageNum);
	    request.setAttribute("totalPageCount", totalPageCount);
	}


	@Override
	public void getDetail(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("num"));
		ReviewDto dto = reviewDao.getData(num);
		request.setAttribute("dto", dto);
	}

	@Override
	public void saveContent(HttpServletRequest request) {
		String id = (String)request.getSession().getAttribute("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String profile = reviewDao.selectProfile(id);
		if(profile==null) {
			profile="";
		}
		int rating = Integer.parseInt(request.getParameter("rating"));
		
		ReviewDto dto = new ReviewDto();
		dto.setWriter(id);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setProfile(profile);
		dto.setRating(rating);
		
		reviewDao.insert(dto);
	}

	@Override
	public void updateContent(ReviewDto dto) {
		reviewDao.update(dto);
	}

	@Override
	public void deleteContent(int num, HttpServletRequest request) {
		reviewDao.delete(num);
	}


	@Override
	public void getMyList(HttpServletRequest request) {
		int pageNum=1;
		
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		String id=(String)request.getSession().getAttribute("id");
		
		ReviewDto dto = new ReviewDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		dto.setWriter(id);
		
		List<ReviewDto> list = reviewDao.getMyList(dto);
		int totalRow = reviewDao.getMyCount(dto);
		
		int totalPageCount=
				(int) Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		
	    //EL에서 사용할 값을 미리 request에 담아두기
	    request.setAttribute("list", list);
	    request.setAttribute("pageNum", pageNum);
	    request.setAttribute("totalPageCount", totalPageCount);
	}


	@Override
	public void moreList(HttpServletRequest request) {
		//파라미터로 전달된 pageNum을 읽어 온다.
		int pageNum=Integer.parseInt(request.getParameter("pageNum"));
		
		final int PAGE_ROW_COUNT=5;
				
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;

		ReviewDto dto = new ReviewDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		List<ReviewDto> list = reviewDao.getList(dto);
		int totalRow = reviewDao.getCount(dto);
				
		//전체 페이지의 갯수 구하기
		int totalPageCount=
				(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		
	
	    //EL에서 사용할 값을 미리 request에 담아두기
	    request.setAttribute("list", list);
	    request.setAttribute("pageNum", pageNum);
	    request.setAttribute("totalPageCount", totalPageCount);			
	}
	
	@Override
	public void moreList2(HttpServletRequest request) {
		//파라미터로 전달된 pageNum을 읽어 온다.
		int pageNum=Integer.parseInt(request.getParameter("pageNum"));
		
		final int PAGE_ROW_COUNT=5;
				
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		String id=(String)request.getSession().getAttribute("id");

		ReviewDto dto = new ReviewDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		dto.setWriter(id);
		
		List<ReviewDto> list = reviewDao.getMyList(dto);
		int totalRow = reviewDao.getMyCount(dto);
				
		//전체 페이지의 갯수 구하기
		int totalPageCount=
				(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		
	
	    //EL에서 사용할 값을 미리 request에 담아두기
	    request.setAttribute("list", list);
	    request.setAttribute("pageNum", pageNum);
	    request.setAttribute("totalPageCount", totalPageCount);			
	}

}
