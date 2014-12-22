package com.my.biz.sm.db;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.my.biz.sm.model.menu.MenuInfo;

/**
 * 模块dao
 * @author Administrator
 *
 */
public interface MenuInfoDao {

	int countByExample(MenuInfoExample example);

	int deleteByExample(MenuInfoExample example);

	int deleteByPrimaryKey(Integer id);

	int insert(MenuInfo record);

	int insertSelective(MenuInfo record);

	List<MenuInfo> selectByExample(MenuInfoExample example);

	/**
	 * 分页查询
	 * 
	 * @param example
	 * @param pageBounds
	 * @return
	 */
	PageList<MenuInfo> selectByExample(MenuInfoExample example,
			PageBounds pageBounds);

	MenuInfo selectByPrimaryKey(Integer id);

	int updateByExampleSelective(@Param("record") MenuInfo record,
			@Param("example") MenuInfoExample example);

	int updateByExample(@Param("record") MenuInfo record,
			@Param("example") MenuInfoExample example);

	int updateByPrimaryKeySelective(MenuInfo record);

	int updateByPrimaryKey(MenuInfo record);
}