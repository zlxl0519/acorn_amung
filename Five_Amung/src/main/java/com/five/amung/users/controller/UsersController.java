package com.five.amung.users.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	
  //seunghui
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
	//아이디찾기 폼 요청처리
	@RequestMapping("/users/idfind_form")
	public String idfindForm() {
		
		return "users/idfind_form";
	}
	//이메일로 아이디 찾는 요청처리
	@RequestMapping("/users/idfind.do")
	public ModelAndView idFind(ModelAndView mView, HttpServletRequest request, UsersDto dto) {
		//이름, 이메일을 request 로 받아가서 dto 에 담고 dao 를 이용해서 맞는 아이디를 리스트로 가져온다.
		List<UsersDto> idList=usersService.idSearch(mView, request, dto);
		ArrayList<Map<Object, String>> findId= new ArrayList<>();
		for(int i=0; i<idList.size(); i++) {
			String id=idList.get(i).getId();
			String regdate=idList.get(i).getRegdate();
			Map<Object, String> user=new HashMap<Object, String>();
			user.put("id", id);
			user.put("regdate", regdate);
			findId.add(user);
		}
		mView.addObject("findId", findId);
		mView.setViewName("users/idfind");
		return mView;
	}
	//휴대폰 번호로 아이디 찾는 요청처리
	@RequestMapping("/users/idfind2.do")
	public ModelAndView idFind2(ModelAndView mView, HttpServletRequest request, UsersDto dto) {
		//휴대폰 번호, 이름으로 아이디찾기
		List<UsersDto> idList=usersService.idSearch(mView, request, dto);
		ArrayList<Map<Object, String>> findId= new ArrayList<>();
		for(int i=0; i<idList.size(); i++) {
			String id=idList.get(i).getId();
			String regdate=idList.get(i).getRegdate();
			Map<Object, String> user=new HashMap<Object, String>();
			user.put("id", id);
			user.put("regdate", regdate);
			findId.add(user);
		}
		mView.addObject("findId", findId);
		mView.setViewName("users/idfind");
		return mView;
	}
	//비밀번호 찾기 폼 요청처리
	@RequestMapping("/users/pwdfind_form")
	public String pwdfindForm() {
		
		return "users/pwdfind_form";
	}
	//비밀번호 찾는 요청처리
	@RequestMapping("/users/pwdfind")
	public ModelAndView pwdFind(ModelAndView mView, HttpServletRequest request, UsersDto dto) {
		//1. 아이디, 이름, 휴대폰 번호 로 일치하는 비밀번호 찾기
		
		//2. 
		
		mView.setViewName("users/pwdfind");
		return mView;
	}
	
	// 리연 추가 - 20200923
	// 한명의 회원 정보 요청 처리
	@RequestMapping("/mypage/private/info")
	public ModelAndView info(HttpServletRequest request, ModelAndView mView) {
		usersService.getInfo(request.getSession(), mView);
		mView.setViewName("mypage/info");
		return mView;
	}//==== info ====
}//======== UsersController ========