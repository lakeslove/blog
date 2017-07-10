package com.lx.blog.controller.open;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lx.blog.controller.AbstractController;
import com.lx.blog.model.User;
import com.lx.blog.service.UserService;

@Controller
public class LoginController extends AbstractController{
	
	private static final Logger log = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = { "login.htm" },method = RequestMethod.GET)
	public String loginGet(Model model) {
		model.addAttribute("user", new User());
		return "tiles.view.body.login";
	}
	
	@RequestMapping(value = { "login.htm" },method = RequestMethod.POST)
	public String loginPost(User user,Model model) {
		
		User wholeUser = userService.loginValidate(user);
		if(wholeUser == null){
			model.addAttribute("user", user);
			model.addAttribute("validateError", getI18nMessage("email.or.password.has.error"));
			return "tiles.view.body.login";
		}
		HttpSession session = getSession();
		session.setAttribute(SESSION_LOGIN_USER, wholeUser);
		return "redirect:index.htm";
	}
	
	@RequestMapping(value = { "logout.htm" },method = RequestMethod.GET)
	public String logout() {
		HttpSession session = getSession();
		session.invalidate();
		return "redirect:index.htm";
	}
}
