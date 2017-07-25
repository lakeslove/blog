package com.lx.blog.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SelectUtil {
	
	private SelectUtil(){};
	
	private static class SilgleSelectUtil{
		private static final SelectUtil INSTANCE = new SelectUtil();
	}
	
	public static List<Option> getList(String[] labelAndValueArray){
		return SilgleSelectUtil.INSTANCE.getOptionList(labelAndValueArray);
	}
	
	public static class Option{
		private Option(String label,String value){
			this.label = label;
			this.value = value;
		}
		private String label;
		private String value;
		public String getLabel() {
			return label;
		}
		public String getValue() {
			return value;
		}
	}
	
	/**
	 * label和value之间必须用:分离
	 * @param labelAndValueArray
	 * @return
	 */
	private List<Option> getOptionList(String[] labelAndValueArray){
		List<Option> optionList = new ArrayList<>();
		for(String labelAndValue:labelAndValueArray){
			String[] tmpArray = labelAndValue.split(":");
			String label = tmpArray[0];
			String value = tmpArray[1];
			Option option = new Option(label,value);
			optionList.add(option);
		}
		return optionList;
	}

}
