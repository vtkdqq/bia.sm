package com.my.biz.sm.web.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class MainController {
	
	@RequestMapping(value = "/index", method = { RequestMethod.GET })
	public String login() {
		return "/index";
	}
}
