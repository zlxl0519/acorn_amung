package com.five.amung.faq.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.five.amung.faq.dto.FaqDto;
import com.five.amung.faq.service.FaqService;

@Controller
public class FaqController {
	@Autowired
	private FaqService faqService;
	
	@RequestMapping("/faq/faq_main")
	public ModelAndView getList(HttpServletRequest request,
			ModelAndView mView) {
		faqService.getList(request);
		mView.setViewName("faq/faq_main");
		return mView;
	}
	
	@RequestMapping("/faq/admin/insertform")
	public ModelAndView insertForm(ModelAndView mView) {
		mView.setViewName("faq/admin/insertform");
		return mView;
	}
	
	@RequestMapping(value="/faq/admin/insert", method=RequestMethod.POST)
	public ModelAndView insert(FaqDto dto, ModelAndView mView, HttpSession session) {
		faqService.saveContent(dto);
		mView.setViewName("faq/admin/insert");
		return mView;
	}
}

