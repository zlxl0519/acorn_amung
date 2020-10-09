package com.five.amung.admin.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.five.amung.popup.dto.PopupDto;
import com.five.amung.reserve.dto.ReserveDto;
import com.five.amung.reserve.dto.RoomPriceDto;

public interface AdminService {
	public void getList(HttpServletRequest request, ReserveDto dto, RoomPriceDto roomPriceDto);
	public void insertPopup(PopupDto dto, HttpServletRequest request,
			HttpServletResponse response, MultipartFile mFile);
	
	public void getPopupData(HttpServletRequest request);
	public void delete();
	public void reserveCancle(ModelAndView mView, HttpServletRequest request);
	public void reserveOk(ModelAndView mView, HttpServletRequest request);
}
