package com.lx.blog.controller.open;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class RegisterController {

	private static final Logger log = LoggerFactory.getLogger(RegisterController.class);
	
	@RequestMapping(value = { "register.htm" })
	public String register() {
		return "tiles.view.body.register";
	}
	
	@ResponseBody
	@RequestMapping(value = { "validateEmail.htm" },method = RequestMethod.POST,produces = "text/html;charset=UTF-8")
	public String validateEmail(String email) {
		if(StringUtils.isNotEmpty(email)){
			
		}
		return "tiles.view.body.register";
	}
	
	
}
