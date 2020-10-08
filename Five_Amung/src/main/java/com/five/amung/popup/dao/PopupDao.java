package com.five.amung.popup.dao;

import com.five.amung.popup.dto.PopupDto;

public interface PopupDao {

	public void insert(PopupDto dto);
	public PopupDto getData();
	public void delete();
}
