package com.five.amung.dogs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.five.amung.dogs.dao.DogsDao;

@Service
public class DogsServiceImpl implements DogsService{
	@Autowired
	private DogsDao dogsDao;
}
