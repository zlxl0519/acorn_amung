package com.five.amung.gallery.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.five.amung.gallery.dto.GalleryCommentDto;
import com.five.amung.gallery.dto.GalleryDto;

public interface GalleryService {

	//리스트
	public void getList(HttpServletRequest request);
	//추가
	public void saveContent(GalleryDto dto, HttpServletRequest request, 
			HttpServletResponse response, MultipartFile mFile) throws IOException;
	//삭제
	public void deleteContent(int num, HttpServletRequest request);
	//수정
	public void updateContent(GalleryDto dto, HttpServletRequest request, 
			HttpServletResponse response, MultipartFile mFile);
	//상세보기
	public void getDetail(HttpServletRequest request);
	//페이징 처리용 ajax list
	public void getAjaxList(int pageNum, HttpServletRequest request);
	
	//=========운영자=================================================
	
	//리스트
	public void getAdminList(HttpServletRequest request);
	//페이징 처리용 ajax list
	public void getAjaxAdminList(int pageNum, HttpServletRequest request);
	
	
	//=========댓글=================================================
	
	public void saveComment(HttpServletRequest request);//댓글 저장 
	
	public void deleteComment(HttpServletRequest request); //댓글 삭제
	
	public void updateComment(GalleryCommentDto dto); //댓글 수정
	
	public void moreCommentList(HttpServletRequest request);//댓글 추가 응답
	
	
}
