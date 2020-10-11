package com.five.amung.qna.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.five.amung.qna.dto.QnaCommentDto;
import com.five.amung.qna.dto.QnaDto;

public interface QnaService {
	//목록보기
	public void getList(HttpServletRequest request);
	
	//글 하나 보기
	public void getDetail(HttpServletRequest request);
	
	//글 작성하기
	public void saveContent(QnaDto dto);
	
	//글 수정하기
	public void updateContent(QnaDto dto);
	
	//글 삭제하기
	public void deleteContent(int num, HttpServletRequest request);
	
	//자기 글 목록
	public void getMyList(HttpServletRequest request);
	
	//댓글 저장
	public void saveComment(HttpServletRequest request);
	
	//댓글 삭제
	public void deleteComment(HttpServletRequest request);
	
	//댓글 수정
	public void updateComment(QnaCommentDto dto);
	
	
}
