package com.five.amung.dogs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.five.amung.dogs.service.DogsService;

@Controller
public class DogsController {
	@Autowired
	private DogsService dogsService;
}
