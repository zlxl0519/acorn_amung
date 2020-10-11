package com.five.amung.qna.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.five.amung.qna.dto.QnaCommentDto;
import com.five.amung.qna.dto.QnaDto;
import com.five.amung.qna.service.QnaService;
import com.five.amung.review.dto.ReviewDto;

@Controller
public class QnaController {
	@Autowired
	private QnaService qnaService;
	
	//목록 보기
	@RequestMapping("/qna/qna_list")
	public ModelAndView getList(HttpServletRequest request, 
			ModelAndView mView) {
		qnaService.getList(request);
		mView.setViewName("qna/qna_list");
		return mView;
	}
	
	//내용 하나 자세히 보기
	@RequestMapping("/qna/content")
	public ModelAndView detail(HttpServletRequest request,
			ModelAndView mView) {
		qnaService.getDetail(request);
		mView.setViewName("qna/content");
		return mView;
	}
	
	//글 작성하기 폼
	@RequestMapping("/qna/private/insertform")
	public ModelAndView insertForm(ModelAndView mView) {
		
		mView.setViewName("qna/insertform");
		return mView;
	}
	
	//글 작성하기
	@RequestMapping(value = "/qna/private/insert", method=RequestMethod.POST)
	public ModelAndView insert(QnaDto dto, ModelAndView mView, HttpSession session) {
		//dto 에 글 작성자 담기 
		String id = (String)session.getAttribute("id");
		dto.setWriter(id);
		qnaService.saveContent(dto);
		mView.setViewName("qna/insert");
		return mView;
	}
	
	//글 수정하기 폼
	@RequestMapping("/qna/updateform")
	public ModelAndView updateform(HttpServletRequest request,
			ModelAndView mView) {
		qnaService.getDetail(request);
		mView.setViewName("qna/updateform");
		return mView;
	}
	
	//글 수정
	@RequestMapping(value="/qna/update", method=RequestMethod.POST)
	public ModelAndView update(QnaDto dto, ModelAndView mView) {
		qnaService.updateContent(dto);
		mView.setViewName("qna/update");
		return mView;
	}
	
	//글 삭제
	@RequestMapping("/qna/delete")
	public ModelAndView delete(int num, HttpServletRequest request,
			ModelAndView mView) {
		qnaService.deleteContent(num, request);
		mView.setViewName("redirect:/qna/qna_list.do");
		return mView;
	}
	
	//내 글 목록보기
	//자기 글 목록 보기
	@RequestMapping("/qna/myqna")
	public ModelAndView getMyList(HttpServletRequest request,
			ModelAndView mView, QnaDto dto) {
		qnaService.getMyList(request);
		mView.setViewName("qna/myqna");
		return mView;
	}
	
	//댓글작성
	@RequestMapping(value = "/qna/private/comment_insert", 
			method=RequestMethod.POST)
	public ModelAndView commentInsert(HttpServletRequest request,
			ModelAndView mView, @RequestParam int ref_group) {
		//새 댓글을 저장하고 
		qnaService.saveComment(request);
		//보고 있던 글 자세히 보기로 다시 리다일렉트 이동 시킨다.
		mView.setViewName("redirect:/qna/content.do?num="+ref_group);
		return mView;
	}
	
	//댓글 삭제
	@RequestMapping("/qna/private/comment_delete")
	public ModelAndView commentDelete(HttpServletRequest request,
			ModelAndView mView, @RequestParam int ref_group) {
		qnaService.deleteComment(request);
		mView.setViewName("redirect:/qna/content.do?num="+ref_group);
		return mView;
	}
	
	//댓글 수정 ajax 요청에 대한 요청 처리 
	@RequestMapping(value = "/qna/private/comment_update", 
			method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> commentUpdate(QnaCommentDto dto){
		//댓글을 수정 반영하고 
		qnaService.updateComment(dto);
		//JSON 문자열을 클라이언트에게 응답한다.
		Map<String, Object> map=new HashMap<>();
		map.put("num", dto.getNum());
		map.put("content", dto.getContent());
		return map;
	}
	
	//비밀글 
	//글 작성하기 폼
	@RequestMapping("/qna/secret_content")
	public ModelAndView secretContent(ModelAndView mView) {
		mView.setViewName("qna/secret_content");
		return mView;
	}
}
