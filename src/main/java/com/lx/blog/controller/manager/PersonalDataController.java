package com.lx.blog.controller.manager;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = {"manager"})
public class PersonalDataController {
	
	private static final Logger log = LoggerFactory.getLogger(PersonalDataController.class);
	
	@RequestMapping(value = { "test2.htm" })
	public String test() {
//		System.out.println(TestError.getTestString());
		return "index";
	}
	
	@RequestMapping(value = { "testError.htm" })
	public String error(Exception error,HttpServletRequest request,HttpServletResponse response) throws IOException {
		error.printStackTrace();
//		System.out.println(Arrays.toString(error.getStackTrace()));
		return "tiles.view.body.testError";
	}
	
	@ExceptionHandler(Throwable.class)
	public void handelThrowable(Throwable throwable){
		throwable.printStackTrace();
	}
	@ExceptionHandler(Exception.class)
	public void handelException(Exception exception){
		exception.printStackTrace();
	}

}
