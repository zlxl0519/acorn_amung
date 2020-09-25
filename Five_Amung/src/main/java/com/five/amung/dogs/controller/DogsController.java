package com.five.amung.dogs.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.five.amung.dogs.dto.DogsDto;
import com.five.amung.dogs.service.DogsService;

@Controller
public class DogsController {
	@Autowired
	private DogsService dogsService;
	
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
	
}
