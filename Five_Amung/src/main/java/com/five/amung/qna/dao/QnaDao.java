package com.five.amung.qna.dao;

import java.util.List;

import com.five.amung.qna.dto.QnaDto;
import com.five.amung.review.dto.ReviewDto;

public interface QnaDao {
	//글 목록
	public List<QnaDto> getList(QnaDto dto);
	
	//글 갯수
	public int getCount(QnaDto dto);
	
	//글 정보 얻어오기
	public QnaDto getData(int num);
	
	//글 정보 얻어오기(오버로딩)
	public QnaDto getData(QnaDto dto);
	
	//조회수 증가
	public void addHit(int num);
	
	//글 작성
	public void insert(QnaDto dto);
	
	//글 수정
	public void update(QnaDto dto);
	
	//글 삭제
	public void delete(int num);
	
	//자신의 글 목록
	public List<QnaDto> getMyList(QnaDto dto);
	public int getMyCount(QnaDto dto);	
}
