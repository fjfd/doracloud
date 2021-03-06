package com.doraemon.cloud.bpm.config;

import java.util.EnumSet;

import javax.servlet.DispatcherType;
import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletRegistration;
import javax.servlet.annotation.WebListener;

import com.doraemon.cloud.bpm.BpmServiceApplication;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.filter.DelegatingFilterProxy;
import org.springframework.web.servlet.DispatcherServlet;

/**
 * @Description:
 * @Author lw
 * @date 2018/8/24 16:51
 */
//@WebListener
public class WebConfigurer implements ServletContextListener {

    private final Logger log = LoggerFactory.getLogger(WebConfigurer.class);

    public AnnotationConfigWebApplicationContext context;

    public void setContext(AnnotationConfigWebApplicationContext context) {
        this.context = context;
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        log.debug("Configuring Spring root application context");

        ServletContext servletContext = sce.getServletContext();

        AnnotationConfigWebApplicationContext rootContext = null;

        if (context == null) {
            rootContext = new AnnotationConfigWebApplicationContext();
            rootContext.register(BpmServiceApplication.class);

            if (rootContext.getServletContext() == null) {
                rootContext.setServletContext(servletContext);
            }

            rootContext.refresh();
            context = rootContext;

        } else {
            rootContext = context;
            if (rootContext.getServletContext() == null) {
                rootContext.setServletContext(servletContext);
            }
        }

        servletContext.setAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE, rootContext);

        EnumSet<DispatcherType> disps = EnumSet.of(DispatcherType.REQUEST, DispatcherType.FORWARD, DispatcherType.ASYNC);

        initSpring(servletContext, rootContext);
        initSpringSecurity(servletContext, disps);

        log.debug("Web application fully configured");
    }

    /**
     * Initializes Spring and Spring MVC.
     */
    private void initSpring(ServletContext servletContext, AnnotationConfigWebApplicationContext rootContext) {
        log.debug("Configuring Spring Web application context");
        AnnotationConfigWebApplicationContext appDispatcherServletConfiguration = new AnnotationConfigWebApplicationContext();
        appDispatcherServletConfiguration.setParent(rootContext);
        appDispatcherServletConfiguration.register(BpmServiceApplication.class);

        log.debug("Registering Spring MVC Servlet");
        ServletRegistration.Dynamic appDispatcherServlet = servletContext.addServlet("appDispatcher",
                new DispatcherServlet(appDispatcherServletConfiguration));
        appDispatcherServlet.addMapping("/app/*");
        appDispatcherServlet.setLoadOnStartup(1);
        appDispatcherServlet.setAsyncSupported(true);

        log.debug("Registering Activiti public REST API");
        AnnotationConfigWebApplicationContext apiDispatcherServletConfiguration = new AnnotationConfigWebApplicationContext();
        apiDispatcherServletConfiguration.setParent(rootContext);
        apiDispatcherServletConfiguration.register(BpmServiceApplication.class);

        ServletRegistration.Dynamic apiDispatcherServlet = servletContext.addServlet("apiDispatcher",
                new DispatcherServlet(apiDispatcherServletConfiguration));
        apiDispatcherServlet.addMapping("/api/*");
        apiDispatcherServlet.setLoadOnStartup(1);
        apiDispatcherServlet.setAsyncSupported(true);
    }

    /**
     * Initializes Spring Security.
     */
    private void initSpringSecurity(ServletContext servletContext, EnumSet<DispatcherType> disps) {
        log.debug("Registering Spring Security Filter");
        FilterRegistration.Dynamic springSecurityFilter = servletContext.addFilter("springSecurityFilterChain", new DelegatingFilterProxy());

        springSecurityFilter.addMappingForUrlPatterns(disps, false, "/*");
        springSecurityFilter.setAsyncSupported(true);
    }


    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        log.info("Destroying Web application");
        WebApplicationContext ac = WebApplicationContextUtils.getRequiredWebApplicationContext(sce.getServletContext());
        AnnotationConfigWebApplicationContext gwac = (AnnotationConfigWebApplicationContext) ac;
        gwac.close();
        log.debug("Web application destroyed");
    }
}
