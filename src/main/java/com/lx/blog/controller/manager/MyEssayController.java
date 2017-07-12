package com.lx.blog.controller.manager;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lx.blog.controller.AbstractController;
import com.lx.blog.model.Essay;
import com.lx.blog.model.EssayContent;
import com.lx.blog.model.User;
import com.lx.blog.service.EssayContentService;
import com.lx.blog.service.EssayService;
import com.lx.blog.util.SelectUtil;

@Controller
@RequestMapping(value = {"manager"})
public class MyEssayController extends AbstractController{
	
	private static final Logger log = LoggerFactory.getLogger(MyEssayController.class);
	
	@Autowired
	private EssayService essayService;
	
	@Autowired
	private EssayContentService essayContentService;
	
	@ResponseBody
	@RequestMapping(value = { "myEssayList.htm" },method = RequestMethod.GET,produces = "text/html;charset=UTF-8")
	public String myEssayList(Model model,Integer currentPage) throws Exception {
		String essasyListJson = essayService.getEssayList(getLoginUserId(),currentPage);
		return essasyListJson;
	}
	
	@RequestMapping(value = { "newblog.htm" },method = RequestMethod.GET)
	public String newBlog(Model model){
		Essay essay = new Essay();
		essay.setFlag(3);
		model.addAttribute("essay", essay);
		String[] labelAndValueArray = getI18nMessage("essay.flag.label.and.value").split(",");
		List<SelectUtil.Option> select = SelectUtil.getList(labelAndValueArray);
		model.addAttribute("select", select);
		return "tiles.view.body.blog";
	}
	
	@RequestMapping(value = { "editblog.htm" },method = RequestMethod.POST)
	public String editBlog(Model model,Long id) {
		Essay essay =  essayService.getEssayByUserIdAndId(getLoginUserId(), id);
		if(essay==null){
			return "redirect:testError";
		}
		model.addAttribute("essay", essay);
		EssayContent essayContent = essayContentService.getEssayContentByEssayId(id);
		model.addAttribute("essayContent", essayContent);
		return "tiles.view.body.mypage";
	}
	
	@RequestMapping(value = { "saveblog.htm" },method = RequestMethod.POST)
	public String saveBlog(Essay essay,String content) {
		essay.setUserId(getLoginUserId());
		essayService.saveEssay(essay, content);
		return "redirect:mypage.htm";
	}
	
	
}
