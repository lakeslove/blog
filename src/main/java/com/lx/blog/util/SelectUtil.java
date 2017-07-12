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
	
	public class Option{
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
	
	private List<Option> getOptionList(String[] labelAndValueArray){
		List<Option> optionList = new ArrayList<>();
		for(String labelAndValue:labelAndValueArray){
			String label = labelAndValue.split(":")[0];
			String value = labelAndValue.split(":")[1];
			Option option = new Option(label,value);
			optionList.add(option);
		}
		return optionList;
	}
	
//	public static List<Map<String,String>> getList(ArrayList<String> values,ArrayList<String> labels) throws Exception{
//		if(values==null||labels==null){
//			throw new Exception("values==null||labels==null");
//		}
//		if(values.size()==0||labels.size()==0){
//			throw new Exception("values.size()==0||labels.size()==0");
//		}
//		if(values.size()!=labels.size()){
//			throw new Exception("values.size()!=labels.size()");
//		}
//		List<Map<String,String>> optionList = new ArrayList<>();
//		for(int i = 0;i<values.size();i++){
//			Map<String, String> option = new HashMap<String,String>();
//			option.put("value", values.get(i));
//			option.put("label", labels.get(i));
//			optionList.add(option);
//		}
//		return optionList;
//	}

}
