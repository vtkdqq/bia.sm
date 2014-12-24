package com.my.biz.sm.model.role;

import com.my.biz.sm.BaseModel;

public class RoleMenu  extends BaseModel
{
    /**
     * serialVersionUID
     */
    private static final long serialVersionUID = 8609848052560652263L;

    private Integer id;

    private Integer roleid;

    private Integer menuid;

    public Integer getId()
    {
        return id;
    }

    public void setId(Integer id)
    {
        this.id = id;
    }

    public Integer getRoleid()
    {
        return roleid;
    }

    public void setRoleid(Integer roleid)
    {
        this.roleid = roleid;
    }

    public Integer getMenuid()
    {
        return menuid;
    }

    public void setMenuid(Integer menuid)
    {
        this.menuid = menuid;
    }
}
