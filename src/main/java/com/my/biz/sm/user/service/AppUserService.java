package com.my.biz.sm.user.service;

import com.my.biz.sm.commons.page.PageData;
import com.my.biz.sm.commons.page.PageParam;
import com.my.biz.sm.user.model.AppUser;

public interface AppUserService
{
    public AppUser getAppUserById(Integer userid);

    /**
     * 分页查询用户对像
     * @param page 分页查询信息
     * @return 返回结果PageData<AppUser>
     */
    public PageData<AppUser> pageQueryAppUser(PageParam<AppUser> page);
}
