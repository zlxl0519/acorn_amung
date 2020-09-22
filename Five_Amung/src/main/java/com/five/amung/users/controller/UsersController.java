package com.five.amung.users.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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
	
	//회원가입 완료 요청 처리(응답페이지 수정 必)
	@RequestMapping("/users/signup")
	public ModelAndView signup(@RequestParam String email01, @RequestParam String email02,
			ModelAndView mView, UsersDto dto) {
		dto.setEmail(email01+"@"+email02);
		usersService.addUser(dto);
		mView.setViewName("redirect:/home.do");
		return mView;
	}
	
	//아이디가 중복확인 기능 : 아이디 존재 여부 요청 처리
	@RequestMapping("/users/checkid")
	@ResponseBody
	public Map<String, Object> checkid(@RequestParam String inputId){
		// boolean값 들어있는 Map 객체 리턴
		return usersService.isExistId(inputId);
	}
	
	//ajax 프로필 사진 업로드 요청 처리
	@RequestMapping("/users/profile_upload")
	@ResponseBody
	public Map<String, Object> profile_upload(HttpServletRequest request, @RequestParam MultipartFile image){
		Map<String, Object> map=usersService.saveProfileImage(request, image);
		return map;
	}
	//회원 목록 보기 요청 처리
	
}