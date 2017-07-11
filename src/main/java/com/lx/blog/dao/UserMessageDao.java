package com.lx.blog.dao;

import org.springframework.stereotype.Repository;

import com.lx.blog.model.UserMessage;

@Repository
public interface UserMessageDao {
	UserMessage getUserMessage(Long id);
}
