package com.five.amung.review.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.five.amung.review.dto.ReviewDto;
import com.five.amung.review.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	
	//글 목록 보기
	@RequestMapping("/review/list")
	public ModelAndView getList(HttpServletRequest request,
			ModelAndView mView) {
		reviewService.getList(request);
		mView.setViewName("review/list");
		return mView;
	}
	
	//자기 글 목록 보기
	@RequestMapping("/review/my_rev")
	public ModelAndView getMyList(HttpServletRequest request,
			ModelAndView mView, ReviewDto dto) {
		String id=(String)request.getSession().getAttribute("id");
		dto.setWriter(id);
		reviewService.getMyList(request);
		mView.setViewName("review/my_rev");
		return mView;
	}
	
	//글 하나 자세히 보기
	@RequestMapping("/review/detail")
	public ModelAndView detail(HttpServletRequest request,
			ModelAndView mView) {
		reviewService.getDetail(request);
		mView.setViewName("review/content");
		return mView;
	}	
	
	//글 작성하기(폼)
	@RequestMapping("/review/private/insertform")
	public ModelAndView insertForm(ModelAndView mView) {
		mView.setViewName("review/insertform");
		return mView;
	}
	
	//글 작성하기
	@RequestMapping(value="/review/private/insert", method=RequestMethod.POST)
	public ModelAndView insert(ModelAndView mView, ReviewDto dto,
			HttpSession session) {
		String id=(String)session.getAttribute("id");
		dto.setWriter(id);
		reviewService.saveContent(dto);
		mView.setViewName("review/insert");
		return mView;
	}	

	//글 수정하기(폼)
	@RequestMapping("/review/private/updateform")
	public ModelAndView updateForm(HttpServletRequest request,
			ModelAndView mView) {
		reviewService.getDetail(request);
		mView.setViewName("review/updateform");
		return mView;
	}
	
	//글 수정하기
	@RequestMapping(value="/review/private/update", method=RequestMethod.POST)
	public ModelAndView update(ModelAndView mView, ReviewDto dto) {
		reviewService.updateContent(dto);
		mView.setViewName("review/update");
		return mView;
	}	
	
	//글 삭제하기
	@RequestMapping("/review/private/delete")
	public ModelAndView delete(int num, HttpServletRequest request,
			ModelAndView mView) {
		reviewService.deleteContent(num, request);
		mView.setViewName("redirect:/review/list.do");
		return mView;
	}
}
