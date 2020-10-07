package com.five.amung.qna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.five.amung.qna.dto.QnaDto;
import com.five.amung.qna.service.QnaService;
import com.five.amung.review.dto.ReviewDto;

@Controller
public class QnaController {
	@Autowired
	private QnaService qnaService;
	
	//목록 보기
	@RequestMapping("/qna/qna_list")
	public ModelAndView getList(HttpServletRequest request, 
			ModelAndView mView) {
		qnaService.getList(request);
		mView.setViewName("qna/qna_list");
		return mView;
	}
	
	//내용 하나 자세히 보기
	@RequestMapping("/qna/content")
	public ModelAndView detail(HttpServletRequest request,
			ModelAndView mView) {
		qnaService.getDetail(request);
		mView.setViewName("qna/content");
		return mView;
	}
	
	//글 작성하기 폼
	@RequestMapping("/qna/private/insertform")
	public ModelAndView insertForm(ModelAndView mView) {
		
		mView.setViewName("qna/insertform");
		return mView;
	}
	
	//글 작성하기
	@RequestMapping(value = "/qna/private/insert", method=RequestMethod.POST)
	public ModelAndView insert(QnaDto dto, ModelAndView mView, HttpSession session) {
		//dto 에 글 작성자 담기 
		String id=(String)session.getAttribute("id");
		dto.setWriter(id);
		qnaService.saveContent(dto);
		mView.setViewName("qna/insert");
		return mView;
	}
	
	//글 수정하기 폼
	@RequestMapping("/qna/updateform")
	public ModelAndView updateform(HttpServletRequest request,
			ModelAndView mView) {
		qnaService.getDetail(request);
		mView.setViewName("qna/updateform");
		return mView;
	}
	
	//글 수정
	@RequestMapping(value="/qna/update", method=RequestMethod.POST)
	public ModelAndView update(QnaDto dto, ModelAndView mView) {
		qnaService.updateContent(dto);
		mView.setViewName("qna/update");
		return mView;
	}
	
	//글 삭제
	@RequestMapping("/qna/delete")
	public ModelAndView delete(int num, HttpServletRequest request,
			ModelAndView mView) {
		qnaService.deleteContent(num, request);
		mView.setViewName("redirect:/qna/qna_list.do");
		return mView;
	}
	
	//내 글 목록보기
	//자기 글 목록 보기
	@RequestMapping("/qna/myqna")
	public ModelAndView getMyList(HttpServletRequest request,
			ModelAndView mView, QnaDto dto) {
		qnaService.getMyList(request);
		mView.setViewName("qna/myqna");
		return mView;
	}
	
}
