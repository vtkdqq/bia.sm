package com.my.biz.sm.service.role;

import java.util.List;

import com.my.biz.sm.commons.page.PageData;
import com.my.biz.sm.commons.page.PageParam;
import com.my.biz.sm.model.role.Role;

public interface RoleService
{
    public Role getRoleById(Integer roleId);

    public PageData<Role> pageQueryRole(PageParam<Role> page);
   
    public Integer addRole(Role role);
    
    /**
     * 查询已启用权限
     * @return List<Role>
     */
    public List<Role> getAvailableRoles();
    
    /**
     * 查询用户权限
     * @param userId 用户id
     * @return List<Role>
     */
    public List<Role> selectByByUserId(Integer userId);
       
}
