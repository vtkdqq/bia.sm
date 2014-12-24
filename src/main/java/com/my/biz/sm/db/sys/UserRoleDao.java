package com.my.biz.sm.db.sys;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.biz.sm.model.user.UserRole;

/**
 * 
 * 用户角色
 * @author Administrator
 *
 */
public interface UserRoleDao
{
    int countByExample(UserRoleExample example);

    int deleteByExample(UserRoleExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(UserRole record);

    int insertSelective(UserRole record);

    List<UserRole> selectByExample(UserRoleExample example);

    UserRole selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") UserRole record, @Param("example") UserRoleExample example);

    int updateByExample(@Param("record") UserRole record, @Param("example") UserRoleExample example);

    int updateByPrimaryKeySelective(UserRole record);

    int updateByPrimaryKey(UserRole record);
}
