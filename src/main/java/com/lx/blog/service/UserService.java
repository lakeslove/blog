package com.lx.blog.service;

import java.util.List;
import com.lx.blog.model.User;
import com.lx.blog.util.PageData;

public interface UserService extends Service<User, Long>{
	public PageData<User> serchUsers(User user,int currentPage);
	public User getUser(Long id);
	public int insertUser(User user);
	public int deleteUser(Long id);
	public int updateUser(User user);
	public List<User> findUsers(String userName,int start,int limit);
}
