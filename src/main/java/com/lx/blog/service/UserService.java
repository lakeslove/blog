package com.lx.blog.service;

import java.util.List;
import com.lx.blog.model.User;
import com.lx.blog.util.PageData;

public interface UserService extends Service<User, Long>{
	PageData<User> serchUsers(User user,int currentPage);
	User getUser(Long id);
	int insertUser(User user);
	int deleteUser(Long id);
	int updateUser(User user);
	List<User> findUsers(String userName,int start,int limit);
	
	User loginValidate(User user);
}
