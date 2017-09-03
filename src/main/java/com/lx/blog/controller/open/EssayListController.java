package com.lx.blog.controller.open;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lx.blog.controller.AbstractController;
import com.lx.blog.service.EssayService;

@Controller
public class EssayListController extends AbstractController{
	
	private static final Logger log = LoggerFactory.getLogger(EssayListController.class);
	
	@Autowired
	private EssayService essayService;
	
	@ResponseBody
	@RequestMapping(value = { "essaylist.htm" },method = RequestMethod.GET,produces = "text/html;charset=UTF-8")
	public String essayList(Model model,Integer currentPage,Integer flag) throws Exception {
		String essasyListJson = essayService.getEssayListByFlag(flag,currentPage);
		return essasyListJson;
	}

}
