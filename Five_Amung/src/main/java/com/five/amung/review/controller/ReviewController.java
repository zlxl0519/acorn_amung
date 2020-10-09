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
	@RequestMapping("/review/rev_list")
	public ModelAndView getList(HttpServletRequest request,
			ModelAndView mView) {
		reviewService.getList(request);
		mView.setViewName("review/rev_list");
		return mView;
	}
	
	//자기 글 목록 보기
	@RequestMapping("/review/my_rev")
	public ModelAndView getMyList(HttpServletRequest request,
			ModelAndView mView, ReviewDto dto) {
		reviewService.getMyList(request);
		mView.setViewName("review/my_rev");
		return mView;
	}
	
	//글 하나 자세히 보기
	@RequestMapping("/review/content")
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
	public ModelAndView insert(ModelAndView mView, HttpServletRequest request) {
		reviewService.saveContent(request);
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
	public ModelAndView update(HttpServletRequest request, ModelAndView mView, ReviewDto dto) {
		int rating = Integer.parseInt(request.getParameter("rating"));
		dto.setRating(rating);
		reviewService.updateContent(dto);
		mView.setViewName("review/update");
		return mView;
	}	
	
	//글 삭제하기
	@RequestMapping("/review/delete")
	public ModelAndView delete(int num, HttpServletRequest request,
			ModelAndView mView) {
		reviewService.deleteContent(num, request);
		mView.setViewName("redirect:/review/rev_list.do");
		return mView;
	}
	
	//스크롤 ajax 요청
	@RequestMapping("/review/rev_ajax_list")
	public ModelAndView ajaxList(HttpServletRequest request,
			ModelAndView mView) {
		reviewService.moreList(request);
		mView.setViewName("review/rev_ajax_list");
		return mView;
	}
	
	//내 글 보기 스크롤 ajax 요청
	@RequestMapping("/review/my_rev_ajax_list")
	public ModelAndView myajaxList(HttpServletRequest request,
			ModelAndView mView) {
		reviewService.moreList2(request);
		mView.setViewName("review/my_rev_ajax_list");
		return mView;
	}
	
}
