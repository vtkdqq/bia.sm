package com.my.biz.sm.web.role.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.biz.sm.commons.page.Page;
import com.my.biz.sm.commons.page.PageData;
import com.my.biz.sm.commons.page.PageParam;
import com.my.biz.sm.model.role.Role;
import com.my.biz.sm.service.role.RoleService;


@Controller
@RequestMapping("/role")
public class RoleController
{
    @Autowired
    private RoleService roleService;

    @RequestMapping(value = "list")
    public String list(Page p, Role role, Model model) {
        PageParam<Role> param = new PageParam<Role>(role,
                p.getPageNo(), p.getPageSize());
        PageData<Role> data = roleService.pageQueryRole(param);
        model.addAttribute("data", data);
        model.addAttribute("role", role);
        return "role/list";
    }

    @RequestMapping("/editRole")
    public String editRole(Model model) {
        return "role/edit";
    }
}
