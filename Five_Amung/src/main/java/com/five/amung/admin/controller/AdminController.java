package com.five.amung.admin.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.five.amung.admin.service.AdminService;
import com.five.amung.popup.dto.PopupDto;
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
		//1. reserveDB 에서 예약상태를 예약 취소로 업데이트 한다.
		
		// 예약 취소 상태이면 그제야 방이 예약 가능하게 바뀜 room state 도 바뀌게 하기
		
		mView.setViewName("redirect: /admin/reserve_list");
		return mView;
	}
	
	@RequestMapping("/admin/popup_upload")
	public String PopupForm(HttpServletRequest request) {
		adminService.getPopupData(request);
		return "admin/popup_upload";
	}
	
	//팝업 업로드 폼
	@RequestMapping(value="/admin/upload", method=RequestMethod.POST)
	public ModelAndView upload(@RequestParam MultipartFile image, PopupDto dto, 
			ModelAndView mView, HttpServletRequest request, HttpServletResponse response) {
		adminService.insertPopup(dto, request, response, image);
		mView.setViewName("redirect:/admin/popup_upload.do");
		return mView;
	}
	
	//팝업창
	@RequestMapping("/admin/popup")
	public ModelAndView popup(ModelAndView mView, HttpServletRequest request) {
		
		adminService.getPopupData(request);
		mView.setViewName("admin/popup");
		return mView;
	}
	
	//일정시간동안 보이지 않기
	@RequestMapping(value="/admin/popup_save", method=RequestMethod.POST)
	public ModelAndView popupSave(ModelAndView mView, HttpServletRequest request, 
			HttpServletResponse response) {

		String canPopup=request.getParameter("canPopup");
		if(canPopup != null){
			Cookie cook=new Cookie("canPopup", canPopup);
			cook.setMaxAge(60*60*24);
			cook.setPath("/");
			response.addCookie(cook);
		}
		
		mView.setViewName("admin/popup_save");
		return mView;
	}
	
	//기존 팝업들 삭제
	@RequestMapping("/admin/delete")
	public ModelAndView delete(ModelAndView mView) {
		adminService.delete();
		mView.setViewName("redirect:/admin/popup_upload.do");
		return mView;
	}
	
}
