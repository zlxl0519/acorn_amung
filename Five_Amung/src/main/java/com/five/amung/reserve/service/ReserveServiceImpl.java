package com.five.amung.reserve.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.five.amung.reserve.dao.ReserveDao;

@Service
public class ReserveServiceImpl implements ReserveService{
	@Autowired
	private ReserveDao reserveDao;
}
