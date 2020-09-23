package com.five.amung.reserve.controller;

import javax.servlet.http.HttpServletRequest;

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
	
	// 리연 추가 - 20200923 일단 페이지만 추가함
	// 마이페이지 / 예약현황
	@RequestMapping("/mypage/private/reserve/status")
	public ModelAndView reserveStatus(HttpServletRequest request, ModelAndView mView) {
		mView.setViewName("mypage/reserve_status");
		return mView;
	}//==== reserveStatus ====
}//======== ReServeController ========