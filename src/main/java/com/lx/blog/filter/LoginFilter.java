package com.lx.blog.filter;

import java.io.File;
import java.io.IOException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.lx.blog.controller.AbstractController;
import com.lx.blog.model.User;
import com.lx.blog.service.UserService;
import com.lx.blog.util.PropertyUtil;

@Component
public class LoginFilter extends HttpServlet implements Filter {

	private static final long serialVersionUID = 679474428206195348L;

	private static final Logger log = LogManager.getLogger(LoginFilter.class);

	private String indexPath;
	List<String> ignoreList = new ArrayList<String>();
//	private UserService userService;

	public void destroy() {

	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		String uri = request.getRequestURI();
		if (log.isDebugEnabled()) {
			log.debug(uri);
		}
		User loginUser = (User) request.getSession().getAttribute(AbstractController.SESSION_LOGIN_USER);
		if (loginUser != null || isIgnored(uri)) {
			chain.doFilter(request, response);
			return;
		} else {
			response.sendRedirect(request.getContextPath() + indexPath);
		}
	}

	public void init(FilterConfig config) throws ServletException {
		indexPath = config.getInitParameter("indexPath");
		String strIgnoreList = config.getInitParameter("ignoreList");

//		ServletContext sc = config.getServletContext();
//		ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(sc);
//		userService = (UserService) ctx.getBean("userService");

		if (strIgnoreList != null && strIgnoreList.length() > 0) {
			ignoreList = Arrays.asList(strIgnoreList.split(","));
		} else {
			ignoreList = new ArrayList<String>();
		}
	}

	private boolean isIgnored(String uri) {
		for (String ignore : ignoreList) {
			if (StringUtils.contains(uri, ignore)) {
				return true;
			}
		}
		return false;
	}
}
