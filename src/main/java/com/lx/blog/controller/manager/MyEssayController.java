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
		model.addAttribute("select", getSelect());
		return "tiles.view.body.blog";
	}
	
	@RequestMapping(value = { "editblog.htm" },method = RequestMethod.GET)
	public String editBlog(Model model,Long id) {
		Essay essay =  essayService.getEssayByUserIdAndId(getLoginUserId(), id);
		if(essay==null){
			return "redirect:../testError";
		}
		model.addAttribute("essay", essay);
		EssayContent essayContent = essayContentService.getEssayContentByEssayId(id);
		model.addAttribute("content", essayContent.getContent());
		model.addAttribute("select", getSelect());
		return "tiles.view.body.blog";
	}
	
	@RequestMapping(value = { "saveblog.htm" },method = RequestMethod.POST)
	public String saveBlog(Essay essay,String content) {
		if(essay.getId()!=null){
			Essay tmpEssay =  essayService.getEssayByUserIdAndId(getLoginUserId(), essay.getId());
			if(tmpEssay==null){
				return "redirect:../testError.htm";
			}
		}
		essay.setUserId(getLoginUserId());
		essayService.saveEssay(essay, content);
		return "redirect:mypage.htm";
	}
	
	@RequestMapping(value = { "deleteblog.htm" },method = RequestMethod.GET)
	public String deleteBlog(Model model,Long id) {
		Essay tmpEssay =  essayService.getEssayByUserIdAndId(getLoginUserId(), id);
		if(tmpEssay==null){
			return "redirect:../testError.htm";
		}
		essayService.deleteEssay(id);
		return "redirect:mypage.htm";
	}
	
	
	
	public List<SelectUtil.Option> getSelect(){
		String[] labelAndValueArray = getI18nMessage("essay.flag.label.and.value").split(",");
		List<SelectUtil.Option> select = SelectUtil.getList(labelAndValueArray);
		return select;
	}
	
}
