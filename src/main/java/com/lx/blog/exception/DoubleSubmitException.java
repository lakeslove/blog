package com.lx.blog.exception;

public class DoubleSubmitException extends CustomException{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1393566306590472332L;

//	@override
	public DoubleSubmitException(){
		super();
	}
	
	public DoubleSubmitException(String message) {
    	super(message);
    }
	
	 public DoubleSubmitException(String message, Throwable cause) {
	        super(message, cause);
	 }
	 
	 public DoubleSubmitException(Throwable cause) {
	        super(cause);
	 }
	
}
