package com.five.amung.users.controller;

import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	
	//로그인폼 요청처리
	@RequestMapping("/users/loginform")
	public String loginform(HttpServletRequest request) {
		//원래가려던 목적지가 있는지 읽어와 보기
		String url=request.getParameter("url");
		//가려던 목적지가 없다면
		if(url==null) {
			String cPath=request.getContextPath();
			url=cPath+"/home.do";//로그인후 인덱스 페이지로가기
		}
		
		String savedId="";
		Cookie[] cooks=request.getCookies();
		if(cooks!=null) {
			for(Cookie tmp:cooks) {
				String key=tmp.getName();
				if(key.equals("savedId")) {
					savedId=tmp.getValue();
				}
			}
		}
		request.setAttribute("savedId", savedId);
		request.setAttribute("url", url);
		return "users/loginform";
	}
	//로그인 요청처리
	@RequestMapping("/users/login")
	public ModelAndView login(ModelAndView mView, UsersDto dto, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		//로그인 
		String url=request.getParameter("url");
		String encodedUrl=URLEncoder.encode(url);
		mView.addObject("url",url);
		mView.addObject("encodedUrl",encodedUrl);
		
		//service 에서 로그인 할 아이디 비밀번호에 맞는 정보 찾아오는 비즈니스로직 처리를 한다.
		usersService.loginProcess(dto, session,response, request, mView);
		mView.setViewName("users/login");
		return mView;
	}
	//로그아웃 요청처리
	@RequestMapping("/users/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/home.do";
	}
}
