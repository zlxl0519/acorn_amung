package com.five.amung.popup.dto;

public class PopupDto {
	
	private int num;
	private String title;
	private int window_width;
	private int window_height;
	private int location_top;
	private int location_left;
	private String imagePath;
	
	
	public PopupDto() {}


	public PopupDto(int num, String title, int window_width, int window_height, int location_top, int location_left,
			String imagePath) {
		super();
		this.num = num;
		this.title = title;
		this.window_width = window_width;
		this.window_height = window_height;
		this.location_top = location_top;
		this.location_left = location_left;
		this.imagePath = imagePath;
	}


	public int getNum() {
		return num;
	}


	public void setNum(int num) {
		this.num = num;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public int getWindow_width() {
		return window_width;
	}


	public void setWindow_width(int window_width) {
		this.window_width = window_width;
	}


	public int getWindow_height() {
		return window_height;
	}


	public void setWindow_height(int window_height) {
		this.window_height = window_height;
	}


	public int getLocation_top() {
		return location_top;
	}


	public void setLocation_top(int location_top) {
		this.location_top = location_top;
	}


	public int getLocation_left() {
		return location_left;
	}


	public void setLocation_left(int location_left) {
		this.location_left = location_left;
	}


	public String getImagePath() {
		return imagePath;
	}


	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}




}
