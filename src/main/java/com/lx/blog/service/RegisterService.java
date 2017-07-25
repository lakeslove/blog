package com.lx.blog.service;

import com.lx.blog.model.Register;
import com.lx.blog.model.User;

public interface RegisterService extends AbstractService<Register, Long>{
	Boolean existEmail(String email);
	Boolean validateEmailAndVerificationCode(User user,String code);
	void sendEmail(String email);
}
