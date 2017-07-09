package com.lx.blog.util;

import java.util.Map;

import org.apache.velocity.app.VelocityEngine;
import org.springframework.ui.velocity.VelocityEngineUtils;

public class VelocitiesUtil {
	 private static VelocityEngine velocityEngine = SpringBeanUtil.getBean(VelocityEngine.class, "velocityEngine");
	 public static String getVelocityText(String templateLocation, Map<String, Object> velocityContext){
		 String velocityText = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, templateLocation, "utf-8", velocityContext);
		 return velocityText;
	 }
}
