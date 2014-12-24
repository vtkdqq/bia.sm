package com.my.biz.sm.db.sys;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.my.biz.sm.model.role.RoleMenu;

public interface RoleMenuDao
{
    public int countByExample(RoleMenuExample example);

    public int deleteByExample(RoleMenuExample example);

    public int deleteByPrimaryKey(Integer id);

    public int insert(RoleMenu record);

    public int insertSelective(RoleMenu record);

    public List<RoleMenu> selectByExample(RoleMenuExample example);

    public RoleMenu selectByPrimaryKey(Integer id);

    public int updateByExampleSelective(@Param("record") RoleMenu record, @Param("example") RoleMenuExample example);

    public int updateByExample(@Param("record") RoleMenu record, @Param("example") RoleMenuExample example);

    public int updateByPrimaryKeySelective(RoleMenu record);

    public int updateByPrimaryKey(RoleMenu record);
}
