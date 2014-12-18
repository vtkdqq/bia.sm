package com.my.biz.sm.service.user.impl;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.my.biz.sm.commons.page.PageConvertor;
import com.my.biz.sm.commons.page.PageData;
import com.my.biz.sm.commons.page.PageParam;
import com.my.biz.sm.db.user.AppUserDao;
import com.my.biz.sm.db.user.AppUserExample;
import com.my.biz.sm.model.user.AppUser;
import com.my.biz.sm.service.user.AppUserService;

@Service("appUserService")
public class AppUserServiceImpl implements AppUserService
{

    @Autowired
    private AppUserDao appUserDao;

    @Override
    public AppUser getAppUserById(Integer userid)
    {
        return appUserDao.selectByPrimaryKey(userid);
    }

    @Override
    public PageData<AppUser> pageQueryAppUser(PageParam<AppUser> page)
    {
        AppUser user = page.getP();
        AppUserExample example=new AppUserExample();
        PageBounds pb = PageConvertor.toPageBounds(page);
        
        PageList<AppUser> list = appUserDao.selectByExample(example, pb);
        return PageConvertor.toPageData(list);
    }

}
