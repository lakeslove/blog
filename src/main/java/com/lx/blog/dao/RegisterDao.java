package com.lx.blog.dao;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

import com.lx.blog.model.Register;

@Repository
public interface RegisterDao {

	Integer existEmail(String email);

	HashMap<String, Integer> validateEmailAndVerificationCode(Register register);

	void insertRegister(Register register);

	int deleteRegister(Long id);
}
