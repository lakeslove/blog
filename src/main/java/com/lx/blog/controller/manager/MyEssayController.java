package com.lx.blog.controller.manager;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lx.blog.controller.AbstractController;
import com.lx.blog.model.User;
import com.lx.blog.service.EssayService;

@Controller
@RequestMapping(value = {"manager"})
public class MyEssayController extends AbstractController{
	
	private static final Logger log = LoggerFactory.getLogger(MyEssayController.class);
	
	@Autowired
	private EssayService essayService;
	
	@ResponseBody
	@RequestMapping(value = { "myEssayList.htm" },method = RequestMethod.GET,produces = "text/html;charset=UTF-8")
	public String myEssayList(Model model,Integer currentPage) throws Exception {
		User user = (User)getSession().getAttribute(SESSION_LOGIN_USER);
		String essasyListJson = essayService.getEssayList(user.getId(),currentPage);
		return essasyListJson;
	}

}
