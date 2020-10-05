package com.five.amung.dogs.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	public boolean insert(HttpServletRequest request, DogsDto dto){
		Map<String, Object> map=new HashMap<String, Object>();
		//1. 강아지 정보를 입력한다.
		//그 아이디에 같은 강아지 이름 존재여부
		boolean isExist=dogsService.insert(request, dto);
		
		return isExist;
	}
	
	@RequestMapping(value = "/dogs/getList", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getList(HttpServletRequest request, DogsDto dto, ModelAndView mView){
		
		Map<String,Object> map=dogsService.getList(request, dto, mView);
		
		return map;
	}
	
	//리연 추가
	//마이페이지 - 강아지 정보보기
	@RequestMapping("/mypage/private/info/dogs")
	@ResponseBody
	public ModelAndView info(HttpServletRequest request, DogsDto dto, ModelAndView mView) {
		usersService.getInfo(request.getSession(), mView);
		dogsService.getList(request, dto, mView);
		mView.setViewName("mypage/dogsinfo");
		return mView;
	}//==== info ====
	
	//마이페이지 -- 강아지 정보 삭제하기
	@RequestMapping("/mypage/private/info/dogs/delete")
	public ModelAndView dogDelete(@RequestParam int num,HttpServletRequest request, DogsDto dto, ModelAndView mView) {
		dogsService.delete(num, dto, request);
		mView.setViewName("redirect:/mypage/private/info/dogs.do");
		return mView;
	}//==== info ====
	
}// ======== DogsController ========