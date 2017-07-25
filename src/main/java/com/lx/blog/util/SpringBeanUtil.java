package com.lx.blog.util;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class SpringBeanUtil {
	
	
	/**
	 * 获取request
	 * @return
	 */
	public static HttpServletRequest getRequest() {
		RequestAttributes ra = RequestContextHolder.getRequestAttributes();
		return ((ServletRequestAttributes) ra).getRequest();
	}

	
	/**
	 * 获取session
	 * @return
	 */
	public static HttpSession getSession() {
		HttpServletRequest request = getRequest();
		return request.getSession();
	}

	
	/**
	 * 获取spring上下文
	 * @return
	 */
	public static ApplicationContext getApplicationContext() {
		ServletContext servletContext = getSession().getServletContext();
		return WebApplicationContextUtils.getRequiredWebApplicationContext(servletContext);
	}

	
	/**
	 * 获取bean
	 * @param T
	 * @param beanId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static <T> T getBean(Class<?> T, String beanId) {
		return (T) getApplicationContext().getBean(beanId);
	}
}
