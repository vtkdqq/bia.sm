package com.my.biz.sm;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;

public class BaseModel implements Serializable
{
    private static final long serialVersionUID = 4429107423350053859L;
    //删除标识
    private Boolean deleted;
    
    @Override
    public String toString()
    {
        return ToStringBuilder.reflectionToString(this);
    }

	public Boolean getDeleted() {
		return deleted;
	}

	public void setDeleted(Boolean deleted) {
		this.deleted = deleted;
	}
    
}
