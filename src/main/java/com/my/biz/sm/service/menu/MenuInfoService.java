package com.my.biz.sm.service.menu;

import com.my.biz.sm.commons.page.PageData;
import com.my.biz.sm.commons.page.PageParam;
import com.my.biz.sm.model.menu.MenuInfo;

public interface MenuInfoService {

	public MenuInfo getMenuInfoById(Integer userid);

    public PageData<MenuInfo> pageQueryMenuInfo(PageParam<MenuInfo> page);

    public Integer addMenuInfo(MenuInfo menuInfo);
}
