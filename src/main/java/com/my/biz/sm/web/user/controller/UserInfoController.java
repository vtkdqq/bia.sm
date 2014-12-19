package com.my.biz.sm.web.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.biz.sm.commons.page.Page;
import com.my.biz.sm.commons.page.PageData;
import com.my.biz.sm.commons.page.PageParam;
import com.my.biz.sm.commons.vo.AjaxJson;
import com.my.biz.sm.model.user.AppUser;
import com.my.biz.sm.service.user.AppUserService;

@Controller
@RequestMapping("/user")
public class UserInfoController {
	@Autowired
	private AppUserService appUserService;

	@RequestMapping(value = "list")
	public String list(Page p, AppUser appUser, Model model) {
		PageParam<AppUser> param = new PageParam<AppUser>(appUser,
				p.getPageNo(), p.getPageSize());
		PageData<AppUser> data = appUserService.pageQueryAppUser(param);
		model.addAttribute("data", data);
		model.addAttribute("vo", appUser);

		return "user/list";
	}

	@RequestMapping("/userAdd")
	public String userAdd(Model model) {
		return "user/user_edit";
	}
	
	// 添加投票
    @RequestMapping("saveUserInfo")
    @ResponseBody
    public AjaxJson saveUserInfo(AppUser appUser, Model model, HttpServletRequest request)
    {
        AjaxJson json = new AjaxJson();
        Integer flag = appUserService.addAppUser(appUser);
        if (flag < 0)
        {
            json.setMsg("添加失败！");
        }
        json.setSuccessedRes(null, "/user/list");
        return json;
    }


	@RequestMapping("/userEdit")
	public String userEdit(Model model, Integer id) {
		AppUser user = appUserService.getAppUserById(id);
		model.addAttribute("user", user);
		return "user/user_edit";
	}

	@RequestMapping(value = "/login", method = { RequestMethod.GET })
	public String login() {
		AppUser user = appUserService.getAppUserById(1);
		if (null != user) {
			System.out.println("------->" + user.getUsername());
		}
		return "user/login";
	}
}
