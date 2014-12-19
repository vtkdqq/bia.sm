package com.my.biz.sm.web.controller;

import java.util.Date;

import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import com.my.biz.sm.commons.constants.MultiDateFormatEditor;


public class BaseController {
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new MultiDateFormatEditor());
	}
}
