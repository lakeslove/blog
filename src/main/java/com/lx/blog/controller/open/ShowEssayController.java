package com.lx.blog.controller.open;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lx.blog.controller.AbstractController;
import com.lx.blog.model.Essay;
import com.lx.blog.model.User;
import com.lx.blog.service.EssayContentService;
import com.lx.blog.service.EssayService;

@Controller
public class ShowEssayController extends AbstractController{
	
	private static final Logger log = LoggerFactory.getLogger(ShowEssayController.class);
	
	@Autowired
	private EssayService essayService;
	
	@Autowired
	private EssayContentService essayContentService;
	
	@RequestMapping(value = { "show.htm" },method = RequestMethod.GET)
	public String show(Model model,Long id) {
		Essay essay = essayService.getEssayAndContent(id);
		model.addAttribute("essay", essay);
		return "tiles.view.body.show";
	}
}
