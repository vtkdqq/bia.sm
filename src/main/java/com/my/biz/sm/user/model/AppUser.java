package com.my.biz.sm.user.model;

import java.util.Date;

import com.my.biz.sm.BaseModel;

public class AppUser extends BaseModel
{
    /**
     * serialVersionUID
     */
    private static final long serialVersionUID = -9028841444128803326L;

    private Integer id;

    private String username;

    private String password;

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

    public String getUsername()
    {
        return username;
    }

    public void setUsername(String username)
    {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password == null ? null : password.trim();
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
