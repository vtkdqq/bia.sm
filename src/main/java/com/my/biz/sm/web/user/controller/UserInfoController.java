package com.my.biz.sm.web.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.my.biz.sm.commons.controller.WebConstants;
import com.my.biz.sm.commons.page.Page;
import com.my.biz.sm.commons.page.PageData;
import com.my.biz.sm.commons.page.PageParam;
import com.my.biz.sm.user.model.AppUser;
import com.my.biz.sm.user.service.AppUserService;
import com.my.biz.sm.web.user.vo.SysUserVo;

@Controller
@RequestMapping("/user")
public class UserInfoController
{
    @Autowired
    private AppUserService appUserService;
    
    
    @RequestMapping(value = "list")
    public String list(Page p, AppUser appUser, Model model)
    {
        PageParam<AppUser> param = new PageParam<AppUser>(appUser, p.getPageNo(), p.getPageSize());
        PageData<AppUser> data = appUserService.pageQueryAppUser(param);
        model.addAttribute("data", data);
        model.addAttribute("vo", appUser);
      
        return "user/list";
    }
    
    @RequestMapping(value = "/login", method = { RequestMethod.GET })
    public String login()
    {
        AppUser user= appUserService.getAppUserById(1);
        if(null !=user)
        {
            System.out.println("------->"+user.getUsername());
        }
        return "user/login";
    }
}
