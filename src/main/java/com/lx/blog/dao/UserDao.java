package com.lx.blog.dao;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.lx.blog.model.Register;
import com.lx.blog.model.User;

@Repository
public interface UserDao {
	User getUser(Long id);

	int insertUser(User user);

	int deleteUser(Long id);

	int updateUser(User user);

	List<User> findUsers(@Param(value = "name") String name);

	Long getCount(@Param(value = "name") String name);

	HashMap<String, Integer> validateEmailAndVerificationCode(Register register);

	User getUserByEmailAndPassword(User user);
}
