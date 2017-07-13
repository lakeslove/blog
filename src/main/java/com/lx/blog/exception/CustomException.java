package com.lx.blog.exception;

public class CustomException extends RuntimeException{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3312281190712091990L;
	
	public boolean hasMessgage = false;

//	@override
	public CustomException(){
		super();
	}
	
	public CustomException(String message) {
		super(message);
		hasMessgage = true;
	}

	public CustomException(String message, Throwable cause) {
		super(message, cause);
		hasMessgage = false;
	}

	public CustomException(Throwable cause) {
		super(cause);
	}
}
