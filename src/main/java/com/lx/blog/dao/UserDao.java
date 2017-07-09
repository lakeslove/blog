package com.lx.blog.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.lx.blog.model.User;

@Repository
public interface UserDao {
	public User getUser(Long id);
	public int insertUser(User user);
	public int deleteUser(Long id);
	public int updateUser(User user);
	public List<User> findUsers(@Param(value="name")String name);
	public Long getCount(@Param(value="name")String name);
}
