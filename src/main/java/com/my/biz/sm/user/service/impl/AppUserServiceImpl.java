package com.my.biz.sm.user.service.impl;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.my.biz.sm.commons.page.PageConvertor;
import com.my.biz.sm.commons.page.PageData;
import com.my.biz.sm.commons.page.PageParam;
import com.my.biz.sm.user.db.AppUserDao;
import com.my.biz.sm.user.db.AppUserExample;
import com.my.biz.sm.user.model.AppUser;
import com.my.biz.sm.user.service.AppUserService;

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
