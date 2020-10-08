package com.five.amung.admin.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import com.five.amung.popup.dto.PopupDto;
import com.five.amung.reserve.dto.ReserveDto;
import com.five.amung.reserve.dto.RoomPriceDto;

public interface AdminService {
	public void getList(HttpServletRequest request, ReserveDto dto, RoomPriceDto roomPriceDto);
	public void insertPopup(PopupDto dto, HttpServletRequest request,
			HttpServletResponse response, MultipartFile mFile);
	
	public void getPopupData(HttpServletRequest request);
	public void delete();
}
