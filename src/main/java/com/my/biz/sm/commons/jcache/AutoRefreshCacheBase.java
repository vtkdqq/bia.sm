/**
 * 
 */
package com.my.biz.sm.commons.jcache;

import com.my.biz.sm.commons.jcache.monitor.Visitable;

/**
 * @author bingyi
 */
public abstract class AutoRefreshCacheBase<K, V> implements Cache<K, V>, Visitable
{

    abstract public long getReflushTime();

    public abstract String getReflushingStatus();

}
