package com.my.biz.sm.model.role;

import java.util.Date;

import com.my.biz.sm.BaseModel;

public class Role extends BaseModel
{
    /**
     * serialVersionUID
     */
    private static final long serialVersionUID = 7878824482690311977L;

    private Integer id;

    private String rolename;

    private Date createtime;

    private Date lastupdate;

    private Integer status;

    public Integer getId()
    {
        return id;
    }

    public void setId(Integer id)
    {
        this.id = id;
    }

    public String getRolename()
    {
        return rolename;
    }

    public void setRolename(String rolename)
    {
        this.rolename = rolename == null ? null : rolename.trim();
    }

    public Date getCreatetime()
    {
        return createtime;
    }

    public void setCreatetime(Date createtime)
    {
        this.createtime = createtime;
    }

    public Date getLastupdate()
    {
        return lastupdate;
    }

    public void setLastupdate(Date lastupdate)
    {
        this.lastupdate = lastupdate;
    }

    public Integer getStatus()
    {
        return status;
    }

    public void setStatus(Integer status)
    {
        this.status = status;
    }
}
