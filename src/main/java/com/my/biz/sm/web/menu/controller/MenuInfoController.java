package com.my.biz.sm.web.menu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.biz.sm.commons.page.Page;
import com.my.biz.sm.commons.page.PageData;
import com.my.biz.sm.commons.page.PageParam;
import com.my.biz.sm.model.menu.MenuInfo;
import com.my.biz.sm.model.user.UserInfo;
import com.my.biz.sm.service.menu.MenuInfoService;
import com.my.biz.sm.service.user.UserInfoService;

@Controller
@RequestMapping("/menu")
public class MenuInfoController {

	@Autowired
	private MenuInfoService menuInfoService;

	@RequestMapping(value = "list")
	public String list(Page p, MenuInfo menuInfo, Model model) {
		PageParam<MenuInfo> param = new PageParam<MenuInfo>(menuInfo,
				p.getPageNo(), p.getPageSize());
		PageData<MenuInfo> data = menuInfoService.pageQueryMenuInfo(param);
		model.addAttribute("data", data);
		model.addAttribute("menu", menuInfo);
		return "menu/list";
	}

	@RequestMapping("/edit")
	public String edit(Model model, Integer id) {
		
		if (id != null) {
			MenuInfo menuInfo = menuInfoService.getMenuInfoById(id);
			model.addAttribute("menu", menuInfo);
		}

		return "menu/edit";
	}

}
