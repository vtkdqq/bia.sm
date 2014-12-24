package com.my.biz.sm.service.menu;

import java.util.List;

import com.my.biz.sm.commons.page.PageData;
import com.my.biz.sm.commons.page.PageParam;
import com.my.biz.sm.model.menu.MenuInfo;

public interface MenuInfoService {

	public MenuInfo getMenuInfoById(Integer userid);

    public PageData<MenuInfo> pageQueryMenuInfo(PageParam<MenuInfo> page);

    public Integer addMenuInfo(MenuInfo menuInfo);
    
    /**
     * 查询权限下的模块
     * @param roleId 权限id
     * @return List<MenuInfo>
     */
    public List<MenuInfo>  selectByByRoleId(Integer roleId);

    /**
     * 查询返回所有
     * @param menuInfo
     * @return
     */
    List<MenuInfo> getMenuInfoAll(MenuInfo menuInfo);
}
