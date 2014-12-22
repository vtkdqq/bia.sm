package com.my.biz.sm.model.menu;

import java.util.Date;

import com.my.biz.sm.BaseModel;

public class MenuInfo extends BaseModel
{

    /**
     * serialVersionUID
     */
    private static final long serialVersionUID = 8652239849057291155L;

    private Integer id;

    private String menuname;

    private Integer parentid;

    private String menucode;

    private String menuurl;

    private String urltarget;

    private Integer navmenu;

    private Integer sort;

    private String remark;

    private Date createtime;

    private Date lastupdate;

    public Integer getId()
    {
        return id;
    }

    public void setId(Integer id)
    {
        this.id = id;
    }

    public String getMenuname()
    {
        return menuname;
    }

    public void setMenuname(String menuname)
    {
        this.menuname = menuname == null ? null : menuname.trim();
    }

    public Integer getParentid()
    {
        return parentid;
    }

    public void setParentid(Integer parentid)
    {
        this.parentid = parentid;
    }

    public String getMenucode()
    {
        return menucode;
    }

    public void setMenucode(String menucode)
    {
        this.menucode = menucode == null ? null : menucode.trim();
    }

    public String getMenuurl()
    {
        return menuurl;
    }

    public void setMenuurl(String menuurl)
    {
        this.menuurl = menuurl == null ? null : menuurl.trim();
    }

    public String getUrltarget()
    {
        return urltarget;
    }

    public void setUrltarget(String urltarget)
    {
        this.urltarget = urltarget == null ? null : urltarget.trim();
    }

    public Integer getNavmenu()
    {
        return navmenu;
    }

    public void setNavmenu(Integer navmenu)
    {
        this.navmenu = navmenu;
    }

    public Integer getSort()
    {
        return sort;
    }

    public void setSort(Integer sort)
    {
        this.sort = sort;
    }

    public String getRemark()
    {
        return remark;
    }

    public void setRemark(String remark)
    {
        this.remark = remark == null ? null : remark.trim();
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
}
