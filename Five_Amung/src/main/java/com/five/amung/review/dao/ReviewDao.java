package com.five.amung.review.dao;

import java.util.List;

import com.five.amung.review.dto.ReviewDto;

public interface ReviewDao {
	//전체 글 목록
	public List<ReviewDto> getList(ReviewDto dto);
	public int getCount(ReviewDto dto);
	
	//자신의 글 목록
	public List<ReviewDto> getMyList(ReviewDto dto);
	public int getMyCount(ReviewDto dto);	
	
	//글 하나 조회
	public ReviewDto getData(int num);
	
	//글 작성하기
	public void insert(ReviewDto dto);
	
	//글 수정하기
	public void update(ReviewDto dto);
	
	//글 삭제하기
	public void delete(int num);
	
	//프로필 조회하기
	public String selectProfile(String id);

	
}
