package com.my.biz.sm.commons.jcache.monitor;

import com.my.biz.sm.commons.jcache.AutoRefreshCacheBase;
import com.my.biz.sm.commons.jcache.Cache;
import com.my.biz.sm.commons.jcache.adv.AdvAutoSaveCache;
import com.my.biz.sm.commons.jcache.adv.AdvCache;

public interface Visitor
{

    void visitAutoRefreshCache(AutoRefreshCacheBase<?, ?> cache, String name);

    void visitAdvAutoSaveCache(AdvAutoSaveCache<?, ?> cache, String name);

    void visitAdvCache(AdvCache<?, ?> cache, String name);

    void visitCustomCache(Cache<?, ?> cache, String name);
}
