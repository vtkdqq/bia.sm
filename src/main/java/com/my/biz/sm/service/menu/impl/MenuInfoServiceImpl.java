package com.my.biz.sm.service.menu.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.my.biz.sm.commons.page.PageConvertor;
import com.my.biz.sm.commons.page.PageData;
import com.my.biz.sm.commons.page.PageParam;
import com.my.biz.sm.db.MenuInfoDao;
import com.my.biz.sm.db.MenuInfoExample;
import com.my.biz.sm.model.menu.MenuInfo;
import com.my.biz.sm.service.menu.MenuInfoService;

@Service("menuInfoService")
public class MenuInfoServiceImpl implements MenuInfoService {

	@Autowired
	private MenuInfoDao menuInfoDao;

	@Override
	public MenuInfo getMenuInfoById(Integer menuId) {

		return menuInfoDao.selectByPrimaryKey(menuId);
	}

	@Override
	public PageData<MenuInfo> pageQueryMenuInfo(PageParam<MenuInfo> page) {
		MenuInfo menu = page.getP();
		MenuInfoExample example = new MenuInfoExample();
		example.createCriteria().andParentidEqualTo(menu.getParentid());
		example.setOrderByClause("createTime desc");
		PageBounds pb = PageConvertor.toPageBounds(page);
		PageList<MenuInfo> list = menuInfoDao.selectByExample(example, pb);
		return PageConvertor.toPageData(list);
	}

	@Override
	public Integer addMenuInfo(MenuInfo menuInfo) {
		return menuInfoDao.insert(menuInfo);
	}

}
