package com.lx.blog.util;

import java.util.Map;

public class JSONData {
	private boolean mark;
	private String message;
	private Object result;
	private Map<String,Object> resultsMap;
	
	public JSONData(){}
	
	public JSONData(boolean mark){
		this.mark=mark;
	}
	
	public JSONData(String message){
		this.message=message;
	}
	
	public JSONData(Object result){
		this.result=result;
	}
	
	public JSONData(Map<String,Object> resultsMap){
		this.resultsMap=resultsMap;
	}
	
	public JSONData(boolean mark,String message){
		this.mark=mark;
		this.message=message;
	}
	
	public JSONData(boolean mark,Object result){
		this.mark=mark;
		this.result=result;
	}
	
	public JSONData(boolean mark,Map<String,Object> resultsMap){
		this.mark=mark;
		this.resultsMap=resultsMap;
	}
	
	public JSONData(boolean mark,String message,Object result){
		this.mark=mark;
		this.message=message;
		this.result=result;
	}

	public boolean isMark() {
		return mark;
	}

	public void setMark(boolean mark) {
		this.mark = mark;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Object getResult() {
		return result;
	}

	public void setResult(Object result) {
		this.result = result;
	}

	public Map<String, Object> getResultsMap() {
		return resultsMap;
	}

	public void setResultsMap(Map<String, Object> resultsMap) {
		this.resultsMap = resultsMap;
	}
	
}
