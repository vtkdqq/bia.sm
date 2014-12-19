package com.my.biz.sm.service.user;

import com.my.biz.sm.commons.page.PageData;
import com.my.biz.sm.commons.page.PageParam;
import com.my.biz.sm.model.user.AppUser;

public interface AppUserService
{
    public AppUser getAppUserById(Integer userid);

    /**
     * 分页查询用户对像
     * @param page 分页查询信息
     * @return 返回结果PageData<AppUser>
     */
    public PageData<AppUser> pageQueryAppUser(PageParam<AppUser> page);

    /**
     * 新增用户
     * @param appUser 用户对像
     * @return Integer
     */
    public Integer addAppUser(AppUser appUser);
}
