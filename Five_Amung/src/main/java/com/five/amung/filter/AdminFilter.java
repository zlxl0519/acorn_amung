package com.five.amung.filter;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter({"/admin/*", "/gallery/admin/*", "/notice/private/*", "/faq/faq_insert.jsp", "/faq/faq_insertform.jsp"}) //어드민만 접근 가능한 곳 맵핑하기
public class AdminFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// 클라이언트가 로그인 했는지 여부를 확인한다.
		// 부모 type을 자식 type 으로 casting 한 후 
		HttpServletRequest req = (HttpServletRequest)request;
		//HttpSession 객체의 참조값을 얻어낸다.
		HttpSession session = req.getSession();
		//로그인된 아이디가 있는지 얻어와본다.
		String id=(String)session.getAttribute("id");
		if(id!=null) {//로그인 됬을때 로그인 아이디를 비교한다.
			if(id.equals("admin")) { //로그인된 상태
				//요청의 흐름 계속 진행시키기
				chain.doFilter(request, response);
			}
		}else{
			//원래 가려던 url정보 읽어오기
			String url = req.getRequestURI();
			
			//GET 방식 전송 파라미터를 query String 으로 얻어오기
			String query=req.getQueryString();
			
			//인코딩 하기
			String encodedUrl=null;
			if(query==null) {//전송 파라미터가 없다면
				encodedUrl = URLEncoder.encode(url);
				
			}else {
				encodedUrl=URLEncoder.encode(url+"?"+query);
			}
			//로그인 폼으로 리다이렉트 이동하라고 응답
			HttpServletResponse res = (HttpServletResponse)response;
			String cPath = req.getContextPath();
			res.sendRedirect(cPath+"/users/loginform.do?url="+encodedUrl);
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
