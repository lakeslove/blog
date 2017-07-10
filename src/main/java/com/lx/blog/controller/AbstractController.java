package com.lx.blog.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class AbstractController {
	private static final Logger log = LoggerFactory.getLogger(AbstractController.class);
	
	public static final String SESSION_LOGIN_USER = "SESSION_LOGIN_USER";
	public static final String RESULT = "result";
	public static final String FALSE = "false";
	public static final String TRUE = "true";

	@Autowired
	protected MessageSource messages;

	
	/**
	 * 获取国际化配置信息
	 * @param code
	 * @return
	 */
	public String getI18nMessage(String code) {
		Locale locale = LocaleContextHolder.getLocale();
		return messages.getMessage(code, null, locale);
	}

	
	/**
	 * 获取request
	 * @return
	 */
	protected HttpServletRequest getRequest() {
		RequestAttributes ra = RequestContextHolder.getRequestAttributes();
		return ((ServletRequestAttributes) ra).getRequest();
	}

	/**
	 * 获取session
	 * @return
	 */
	protected HttpSession getSession() {
		HttpServletRequest request = getRequest();
		return request.getSession();
	}
	
	
	
	@ModelAttribute
	public void preMethod(Model model,HttpServletRequest request,HttpServletResponse response){
		
	}
	
}
