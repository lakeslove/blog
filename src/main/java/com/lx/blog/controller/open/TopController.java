package com.lx.blog.controller.open;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lx.blog.controller.AbstractController;

@Controller
public class TopController {
	private static final Logger log = LoggerFactory.getLogger(AbstractController.class);
	
//	@Autowired
//	private UserService userService;
	
	@RequestMapping(value = { "index.htm" })
	public String index() {
		return "tiles.view.body.index";
	}
	@RequestMapping(value = { "datas.htm" })
	public String datas() {
		return "tiles.view.body.datas";
	}
	@RequestMapping(value = { "files.htm" })
	public String files() {
		return "tiles.view.body.files";
	}
	
	@RequestMapping("test.htm")
	public String getTole(@RequestParam("id") Long id,Model model){
//		long start = System.currentTimeMillis();
//		User User = this.userService.getUser(id);
//		Long end = System.currentTimeMillis();
//		System.err.println(end - start);
//		model.addAttribute("user", User);
		return "test";
	}

}
