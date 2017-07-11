package com.lx.blog.service;

import com.lx.blog.model.UserMessage;

public interface UserMessageService extends Service<UserMessage, Long>{
	UserMessage getUserMessage(Long id);
}
