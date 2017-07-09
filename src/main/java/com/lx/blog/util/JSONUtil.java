package com.lx.blog.util;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;

import org.apache.commons.lang.StringUtils;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

public class JSONUtil {
	 /** 
     * ObjectMapper是JSON操作的核心，Jackson的所有JSON操作都是在ObjectMapper中实现。 
     * ObjectMapper有多个JSON序列化的方法，可以把JSON字符串保存File、OutputStream等不同的介质中。 
     * writeValue(File arg0, Object arg1)把arg1转成json序列，并保存到arg0文件中。 
     * writeValue(OutputStream arg0, Object arg1)把arg1转成json序列，并保存到arg0输出流中。 
     * writeValueAsBytes(Object arg0)把arg0转成json序列，并把结果输出成字节数组。 
     * writeValueAsString(Object arg0)把arg0转成json序列，并把结果输出成字符串。 
     */  
	public static void writeValue(File file, Object data) throws JsonGenerationException, JsonMappingException, IOException {
		ObjectMapper objm = new ObjectMapper();
		objm.writeValue(file, data);
	}
	public static void writeValue(OutputStream ops, Object data) throws JsonGenerationException, JsonMappingException, IOException {
		ObjectMapper objm = new ObjectMapper();
		objm.writeValue(ops, data);
	}
	public static byte[] writeValueAsBytes(Object data) throws JsonGenerationException, JsonMappingException, IOException {
		ObjectMapper objm = new ObjectMapper();
		return objm.writeValueAsBytes(data);
	}
	public static String writeValueAsString(Object data) throws JsonGenerationException, JsonMappingException, IOException {
		ObjectMapper objm = new ObjectMapper();
		return objm.writeValueAsString(data);
	}
	
	public static String getEscapeJSONString(Object data) throws JsonGenerationException, JsonMappingException, IOException {
		ObjectMapper objm = new ObjectMapper();
		String JSONString = objm.writeValueAsString(data);
		return escapeJSONString(JSONString);
	}
	
	/**
	 * 由于生成的JSON字符串的转义函数
	 * 由于生成的JSON字符串里的值被双引号包裹,而值中的双引号又被转义,所以只需要转"<"和">"即可
	 * 但是由于"<"和">"转义后会出现"&",不利于反转义,所以在转"<"和">"之前需要先转"&".
	 * @param JSONString
	 * @return
	 */
	public static String escapeJSONString(String JSONString) {
		if (StringUtils.isNotEmpty(JSONString)) {
			StringBuilder builder = new StringBuilder();
			for (char c : JSONString.toCharArray()) {
				switch (c) {
				case '&':
					builder.append("&amp;");
					break;
				case '<':
					builder.append("&lt;");
					break;
				case '>':
					builder.append("&gt;");
					break;
				default:
					builder.append(c);
				}
			}
			return builder.toString();
		}
		return JSONString;
	}
	
	/**
	 * 从json字符串转化为对象
	 * @param jsonString
	 * @param valueType
	 * @return
	 * @throws Exception
	 */
	public <T> T readValue(String jsonString,Class<T> valueType) throws Exception{
		ObjectMapper mapper = new ObjectMapper();  
		return mapper.readValue(jsonString, valueType);  
	}
}
