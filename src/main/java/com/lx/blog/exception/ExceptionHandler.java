package com.lx.blog.exception;

import java.util.Map;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

public class ExceptionHandler implements HandlerExceptionResolver {
	
	private static final Logger log = LogManager.getLogger(ExceptionHandler.class);
	
	@Override
	public ModelAndView resolveException(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex) {
		ex.printStackTrace();
		log.error(ex.getMessage());
		Map<String, Object> model = new HashMap<String, Object>();
//		if(ex instanceof CustomException){
//			model.put("errorMessage", ex.getMessage());
////			log.error(ex.getMessage());
//		}else{
//			log.error(ex.getMessage(), ex);
//			model.put("errorMessage", "system error");
//		}
//		model.put("isIndexPage", true);
		return new ModelAndView("tiles.view.body.testError", model);
	}
}
