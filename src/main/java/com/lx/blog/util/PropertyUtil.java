package com.lx.blog.util;

import java.util.Properties;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class PropertyUtil {
	
	private static final Log log = LogFactory.getLog(PropertyUtil.class);
	private static Properties allProperties;
	private static String[] propertyNames = new String[]{"system.properties",
														"message_error.properties",
														"message_generic.properties",
														"message_validate.properties"};
	
	public static String getPropertyValue(String key) {
		if(allProperties==null){
			allProperties = loadProperties(propertyNames);
		}
		return (String)allProperties.get(key);
	}
	
	public static String getPropertyFromProperties(String key,String propertiesName) {
		Properties propertiesTmp = loadProperties(propertiesName);
		return (String)propertiesTmp.get(key);
	}
	
	public static Properties loadProperties(String... propertiesNames){
		Properties propertiesTmp = new Properties();
		loadProperties(propertiesTmp,propertiesNames);
		return propertiesTmp;
	}
	
	public static void loadProperties(Properties propertiesTmp,String... propertiesNames){
		try {
			for(String propertiesName : propertiesNames)
			propertiesTmp.load(PropertyUtil.class.getClassLoader().getResourceAsStream(propertiesName));
		} catch (Exception e) {
			log.error(e);
			throw new RuntimeException("loadProperties ERROR:"+e.getMessage(),e);
		}
	}
	
	public static Properties getProperties(String propertiesName) {
		Properties propertiesTmp = loadProperties(propertiesName);
		return propertiesTmp;
	}
}


