package com.five.amung.notice.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.five.amung.notice.service.NoticeService;


@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	//공지사항 글 목록 보기 요청 처리
	@RequestMapping("/notice/list")
	public String noticeList() {
		return "notice/list";
	}
	
}