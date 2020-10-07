package com.five.amung.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.five.amung.admin.service.AdminService;
import com.five.amung.reserve.dto.ReserveDto;
import com.five.amung.reserve.dto.RoomPriceDto;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/admin/list")
	public String adminList() {
		return "admin/list";
	}
	
	@RequestMapping("/admin/reserve_list")
	public ModelAndView reserveList(HttpServletRequest request, ModelAndView mView, ReserveDto dto, RoomPriceDto roomPriceDto) {
		adminService.getList(request, dto, roomPriceDto);
		mView.setViewName("admin/reserve_list");
		return mView;
	}
	
	@RequestMapping("/admin/reserve_cancle")
	public ModelAndView reserveCancle(ModelAndView mView, HttpServletRequest request) {
		adminService.reserveCancle(mView, request);
		mView.setViewName("redirect: /amung/admin/reserve_list.do");
		return mView;
	}
	
	@RequestMapping("/admin/reserve_ok")
	public ModelAndView reserveOk(ModelAndView mView, HttpServletRequest request) {
		adminService.reserveOk(mView, request);
		mView.setViewName("redirect:/admin/reserve_list.do");
		return mView;
	}
}
