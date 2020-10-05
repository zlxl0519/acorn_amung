package com.five.amung.admin.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.five.amung.reserve.dto.ReserveDto;
import com.five.amung.reserve.dto.RoomPriceDto;

public interface AdminService {
	public void getList(HttpServletRequest request, ReserveDto dto, RoomPriceDto roomPriceDto);
	public void reserveCancle(ModelAndView mView, HttpServletRequest request);
}
