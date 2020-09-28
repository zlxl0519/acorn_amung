package com.five.amung.dogs.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.five.amung.dogs.dto.DogsDto;
import com.five.amung.dogs.service.DogsService;
import com.five.amung.users.service.UsersService;

@Controller
public class DogsController {
	@Autowired
	private DogsService dogsService;
	
	@Autowired
	private UsersService usersService;
	
	@RequestMapping(value = "/dogs/insert", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insert(HttpServletRequest request, DogsDto dto){
		//1. 강아지 정보를 입력한다.
		dogsService.insert(request, dto);
		
		//2. 강아지 정보를 map 으로 리턴한다.
		Map<String,Object> map=dogsService.getList(request, dto);
		
		return map;
	}
	
	@RequestMapping(value = "/dogs/getList", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getList(HttpServletRequest request, DogsDto dto){
		
		Map<String,Object> map=dogsService.getList(request, dto);
		
		return map;
	}
	
	//리연 추가
	//마이페이지 - 강아지 정보보기
	@RequestMapping("/mypage/private/info/dogs")
	public ModelAndView info(HttpServletRequest request, DogsDto dto, ModelAndView mView) {
		usersService.getInfo(request.getSession(), mView);
		dogsService.getList(request, dto);
		mView.setViewName("mypage/dogsinfo");
		return mView;
	}//==== info ====
}// ======== DogsController ========