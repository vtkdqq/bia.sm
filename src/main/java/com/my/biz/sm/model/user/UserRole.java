package com.my.biz.sm.model.user;

import com.my.biz.sm.BaseModel;

public class UserRole extends BaseModel
{
    /**
     * serialVersionUID
     */
    private static final long serialVersionUID = -4148564051721135192L;

    private Integer id;

    private Integer userid;

    private Integer roleid;

    public Integer getId()
    {
        return id;
    }

    public void setId(Integer id)
    {
        this.id = id;
    }

    public Integer getUserid()
    {
        return userid;
    }

    public void setUserid(Integer userid)
    {
        this.userid = userid;
    }

    public Integer getRoleid()
    {
        return roleid;
    }

    public void setRoleid(Integer roleid)
    {
        this.roleid = roleid;
    }
}
