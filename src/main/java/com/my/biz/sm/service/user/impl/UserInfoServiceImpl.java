package com.my.biz.sm.service.user.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.my.biz.sm.commons.page.PageConvertor;
import com.my.biz.sm.commons.page.PageData;
import com.my.biz.sm.commons.page.PageParam;
import com.my.biz.sm.db.sys.UserInfoDao;
import com.my.biz.sm.db.sys.UserInfoExample;
import com.my.biz.sm.model.user.UserInfo;
import com.my.biz.sm.service.user.UserInfoService;

@Service("appUserService")
public class UserInfoServiceImpl implements UserInfoService
{

    @Autowired
    private UserInfoDao appUserDao;

    @Override
    public UserInfo getAppUserById(Integer userid)
    {
        return appUserDao.selectByPrimaryKey(userid);
    }

    @Override
    public PageData<UserInfo> pageQueryAppUser(PageParam<UserInfo> page)
    {
        UserInfo user = page.getP();
        UserInfoExample example = new UserInfoExample();
        PageBounds pb = PageConvertor.toPageBounds(page);

        PageList<UserInfo> list = appUserDao.selectByExample(example, pb);
        return PageConvertor.toPageData(list);
    }

    @Override
    public Integer addAppUser(UserInfo appUser)
    {
        appUser.setCreatetime(new Date());
        appUser.setDeleted(false);
        appUser.setLastupdate(new Date());
        return appUserDao.insert(appUser);
    }

    @Override
    public List<UserInfo> selectByExample(UserInfo userInfo)
    {
        UserInfoExample example = new UserInfoExample();
        example.createCriteria().andUsernameNotEqualTo(userInfo.getUsername());
        return appUserDao.selectByExample(example);
    }

    @Override
    public UserInfo getUserByUserName(String userName)
    {
        UserInfo userInfo = new UserInfo();
        userInfo.setUsername(userName);
        List<UserInfo> userList = this.selectByExample(userInfo);
        if (userList != null && !userList.isEmpty())
        {
            return userList.get(0);
        }
        return null;
    }

}
