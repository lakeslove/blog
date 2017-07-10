package com.lx.blog.dao;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

import com.lx.blog.model.Register;

@Repository
public interface RegisterDao {
	
	Integer existEmail(String email);
	HashMap<String,Integer> validateEmailAndVerificationCode(Register register);
	void insertRegister(Register register);
	int deleteRegister(Long id);
	
//	public User getUser(Long id);
//	public int updateUser(User user);
//	public List<User> findUsers(@Param(value="name")String name);
//	public Long getCount(@Param(value="name")String name);
}
