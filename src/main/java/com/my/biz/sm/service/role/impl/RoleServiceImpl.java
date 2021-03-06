package com.my.biz.sm.service.role.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.my.biz.sm.commons.page.PageConvertor;
import com.my.biz.sm.commons.page.PageData;
import com.my.biz.sm.commons.page.PageParam;
import com.my.biz.sm.db.sys.RoleDao;
import com.my.biz.sm.db.sys.RoleExample;
import com.my.biz.sm.db.sys.UserInfoDao;
import com.my.biz.sm.db.sys.UserInfoExample;
import com.my.biz.sm.model.role.Role;
import com.my.biz.sm.model.user.UserInfo;
import com.my.biz.sm.service.role.RoleService;

@Service("roleService")
public class RoleServiceImpl implements RoleService
{

    @Autowired
    private RoleDao roleDao;
    
    @Override
    public Role getRoleById(Integer roleId)
    {
        return roleDao.selectByPrimaryKey(roleId);
    }

    @Override
    public PageData<Role> pageQueryRole(PageParam<Role> page)
    {
        Role role = page.getP();
        RoleExample example=new RoleExample();
        PageBounds pb = PageConvertor.toPageBounds(page);
        PageList<Role> list = roleDao.selectByExample(example, pb);
        return PageConvertor.toPageData(list);
    }

    @Override
    public Integer addRole(Role role)
    {
        role.setDeleted(false);
        role.setCreatetime(new Date());
        role.setLastupdate(new Date());
        return roleDao.insert(role);
    }

    @Override
    public List<Role> getAvailableRoles()
    {
        RoleExample example=new RoleExample();
        example.createCriteria().andStatusEqualTo(1);
        return roleDao.selectByExample(example);
    }

    @Override
    public List<Role> selectByByUserId(Integer userId)
    {
        return roleDao.selectByByUserId(userId);
    }
    
    
    

}
