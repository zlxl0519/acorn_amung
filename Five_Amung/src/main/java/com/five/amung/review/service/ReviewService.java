package com.five.amung.review.service;

import javax.servlet.http.HttpServletRequest;

import com.five.amung.review.dto.ReviewDto;

public interface ReviewService {
	//전체 글 목록
	public void getList(HttpServletRequest request);
	
	//자기 글 목록
	public void getMyList(HttpServletRequest request);
	
	//글 하나 내용
	public void getDetail(HttpServletRequest request);
	
	//글 작성
	public void saveContent(HttpServletRequest request);
	
	//글 수정
	public void updateContent(ReviewDto dto);
	
	//글 삭제
	public void deleteContent(int num, HttpServletRequest request);
	
	//리스트 페이징 추가 응답
	public void moreList(HttpServletRequest request);
	
	
}
