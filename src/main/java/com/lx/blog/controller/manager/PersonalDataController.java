package com.lx.blog.controller.manager;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lx.blog.controller.AbstractController;
import com.lx.blog.model.User;
import com.lx.blog.model.UserMessage;
import com.lx.blog.service.UserMessageService;
import com.lx.blog.service.UserService;

@Controller
@RequestMapping(value = {"manager"})
public class PersonalDataController extends AbstractController{
	
	private static final Logger log = LoggerFactory.getLogger(PersonalDataController.class);
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private UserMessageService userMessageService;
	
	@RequestMapping(value = { "mypage.htm" },method = RequestMethod.GET)
	public String mypage(Model model) {
		
		User user = (User)getSession().getAttribute(SESSION_LOGIN_USER);
		UserMessage userMessage = userMessageService.getUserMessage(user.getId());
		model.addAttribute("user", user);
		model.addAttribute("userMessage", userMessage);
		return "tiles.view.body.mypage";
	}

}
