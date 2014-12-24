package com.my.biz.sm.service.role;

import com.my.biz.sm.commons.page.PageData;
import com.my.biz.sm.commons.page.PageParam;
import com.my.biz.sm.model.role.Role;
import com.my.biz.sm.model.user.UserInfo;

public interface RoleService
{
    public Role getRoleById(Integer roleId);

    public PageData<Role> pageQueryRole(PageParam<Role> page);
   
    public Integer addRole(Role role);
}
