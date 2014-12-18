package com.my.biz.sm.db.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.my.biz.sm.model.user.AppUser;

public interface AppUserDao
{
    int countByExample(AppUserExample example);

    int deleteByExample(AppUserExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(AppUser record);

    int insertSelective(AppUser record);

    List<AppUser> selectByExample(AppUserExample example);

    /**
     * 分页查询
     * @param example
     * @param pageBounds
     * @return
     */
    PageList<AppUser> selectByExample(AppUserExample example, PageBounds pageBounds);

    AppUser selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") AppUser record, @Param("example") AppUserExample example);

    int updateByExample(@Param("record") AppUser record, @Param("example") AppUserExample example);

    int updateByPrimaryKeySelective(AppUser record);

    int updateByPrimaryKey(AppUser record);
}
