package com.five.amung.reserve.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.five.amung.reserve.service.ReserveService;

@Controller
public class ReserveController {
	@Autowired
	private ReserveService reserveService;
	
	@RequestMapping("/reserve/reserveform")
	public ModelAndView reserveform(ModelAndView mView) {
		
		mView.setViewName("reserve/reserveform");
		return mView;
	}
}
