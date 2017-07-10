package com.lx.blog.controller.open;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lx.blog.controller.AbstractController;
import com.lx.blog.model.Register;
import com.lx.blog.model.User;
import com.lx.blog.service.RegisterService;
import com.lx.blog.util.JSONData;
import com.lx.blog.util.JSONUtil;
import com.lx.blog.util.ValidateUtils;

@Controller
public class RegisterController extends AbstractController{

	private static final Logger log = LoggerFactory.getLogger(RegisterController.class);
		
	@Autowired
	private RegisterService registerService;
	
	@RequestMapping(value = { "register.htm" },method = RequestMethod.GET)
	public String registerGet(Model model) {
		model.addAttribute("user", new User());
		return "tiles.view.body.register";
	}
	
	@ResponseBody
	@RequestMapping(value = { "getVerificationCode.htm" },method = RequestMethod.POST,produces = "text/html;charset=UTF-8")
	public String validateEmail(String email) throws Exception {
		String message = null;
		if(StringUtils.isEmpty(email)||!ValidateUtils.isEmail(email)){
			message = getI18nMessage("error.email.format");
			return getJsonData(false,message);
		}
		boolean existEmail = registerService.existEmail(email);
		if(existEmail){
			message = getI18nMessage("error.email.has.existed");
			return getJsonData(false,message);
		}
		registerService.sendEmail(email);
		message = getI18nMessage("email.verification.code.has.send");
		return getJsonData(true,message);
	}
	
	public String getJsonData(Boolean mark,String message) throws Exception{
		JSONData jsonData = new JSONData(mark,message);
		return JSONUtil.writeValueAsString(jsonData);
	}
	
	@RequestMapping(value = { "register.htm" },method = RequestMethod.POST)
	public String registerPost(User user,String code,Model model) {
		
		boolean existVerificationCode = registerService.validateEmailAndVerificationCode(user,code);
		if(!existVerificationCode){
			model.addAttribute("user", user);
			model.addAttribute("validateError", getI18nMessage("email.or.verification.code.has.error"));
			return "tiles.view.body.register";
		}
		HttpSession session = getSession();
		session.setAttribute(SESSION_LOGIN_USER, user);
		return "redirect:index.htm";
	}
	
}
