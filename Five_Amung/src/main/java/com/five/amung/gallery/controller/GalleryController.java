package com.five.amung.gallery.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.five.amung.gallery.dto.GalleryDto;
import com.five.amung.gallery.service.GalleryService;

@Controller
public class GalleryController {
	
	@Autowired
	private GalleryService galleryService;
	
	@RequestMapping("/gallery/list")
	public ModelAndView list(HttpServletRequest request, ModelAndView mView) {
		galleryService.getList(request);
		mView.setViewName("gallery/list");
		return mView;
	}
	
	@RequestMapping("/gallery/admin/upload_form")
	public String upload_form() {
		return "gallery/admin/upload_form";
	}
	
	@RequestMapping(value="/gallery/admin/upload", method=RequestMethod.POST)
	public ModelAndView upload(GalleryDto dto, ModelAndView mView, HttpServletRequest request, 
			HttpServletResponse response, @RequestParam MultipartFile image) throws IOException {
		galleryService.saveContent(dto, request, response, image);
		mView.setViewName("redirect:/gallery/list.do");
		return mView;
	}
	
	@RequestMapping("/gallery/ajax_list")
	@ResponseBody
	public ModelAndView ajax_list(@RequestParam int pageNum, HttpServletRequest request, ModelAndView mView){
		galleryService.getAjaxList(pageNum, request);
		mView.setViewName("gallery/ajax_list");
		return mView;
	}
	
	@RequestMapping("/gallery/content")
	public ModelAndView content(HttpServletRequest request, ModelAndView mView) {
		galleryService.getDetail(request);
		mView.setViewName("gallery/content");
		return mView;
	}
	
	//=====================================운영자===========================================
	
	@RequestMapping("/gallery/admin/list_admin")
	public ModelAndView list_admin(HttpServletRequest request, ModelAndView mView) {
		galleryService.getAdminList(request);
		mView.setViewName("gallery/admin/list_admin");
		return mView;
	}

}
