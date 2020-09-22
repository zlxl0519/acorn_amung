package com.five.amung.notice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.five.amung.notice.dto.NoticeDto;
import com.five.amung.notice.service.NoticeService;


@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	//공지사항 글 목록 보기 요청 처리
	@RequestMapping("/notice/list")
	public ModelAndView noticeList(HttpServletRequest request, ModelAndView mView) {
		noticeService.getList(request);
		mView.setViewName("notice/list");
		return mView;
	}//==== noticeList ====
	
	// 공지사항 글 자세히 보기
	@RequestMapping("/notice/detail")
	public ModelAndView detail(HttpServletRequest request, ModelAndView mView) {
		noticeService.getDetail(request);
		mView.setViewName("notice/detail");
		return mView;
	}//==== noticeDetail ====
	
	//공지사항 게시글 작성 폼
	@RequestMapping("/notice/private/insertform")
	public ModelAndView noticeInsertform(ModelAndView mView) {
		mView.setViewName("notice/insertform");
		return mView;
	}//==== noticeInsertForm====
	
	//공지사항 게시글 작성 요청 처리
	@RequestMapping(value = "/notice/private/insert", method=RequestMethod.POST)
	public ModelAndView noticeInsert(NoticeDto dto, ModelAndView mView, HttpSession session) {
		noticeService.saveContent(dto);
		mView.setViewName("notice/insert");
		return mView;
	}//==== noticeInsert =====
	
	//공지사항 게시글 수정 폼
	@RequestMapping("/notice/private/updateform")
	public ModelAndView noticeUpdateform(HttpServletRequest request, ModelAndView mView) {
		noticeService.getDetail(request);
		mView.setViewName("notice/updateform");
		return mView;
	}//==== noticeInsertForm====
	
	//공지사항 게시글 수정 요청 처리
	@RequestMapping(value = "/notice/private/update", method=RequestMethod.POST)
	public ModelAndView noticeUpdate(NoticeDto dto, ModelAndView mView, HttpSession session) {
		noticeService.updateContent(dto);
		mView.setViewName("notice/update");
		return mView;
	}//==== noticeInsert =====
}//======== NoticeController ========