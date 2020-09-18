package com.five.amung.users.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.five.amung.users.dao.UsersDao;
import com.five.amung.users.dto.UsersDto;
import com.five.amung.users.service.UsersService;


@Controller
public class UsersController {

	@Autowired
	private UsersService usersService;
	
	//회원가입 폼 페이지 요청 처리(完)
	@RequestMapping("/users/signup_form")
	public String signupForm() {
		return "users/signup_form";
	}
	
	//회원가입 완료 요청 처리
	@RequestMapping("/users/signup")
	public ModelAndView signup(@RequestParam String email01, @RequestParam String email02,
			ModelAndView mView, UsersDto dto) {
		dto.setEmail(email01+"@"+email02);
		usersService.addUser(dto);
		mView.setViewName("redirect:/home.do");
		return mView;
	}
	
	//아이디가 중복확인 기능 : 아이디 존재 여부 요청 처리
	
	//ajax 프로필 사진 업로드 요청 처리
	
	//회원 목록 보기 요청 처리
	
}
