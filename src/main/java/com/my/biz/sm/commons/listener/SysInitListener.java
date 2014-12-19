package com.my.biz.sm.commons.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.joda.time.DateTime;

@WebListener
public class SysInitListener implements ServletContextListener
{
    public final static String RES_VESION = "res_vesion";

    public void contextInitialized(ServletContextEvent sce)
    {
        ServletContext sc = sce.getServletContext();
        String timestamp = String.valueOf(DateTime.now().getMillis());
        // 静态资源版本
        sc.setAttribute(RES_VESION, timestamp);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce)
    {
        // TODO Auto-generated method stub

    }
}
