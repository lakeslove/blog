package com.lx.blog.service.Impl;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lx.blog.dao.UserMessageDao;
import com.lx.blog.model.UserMessage;
import com.lx.blog.service.UserMessageService;


@Service
public class UserMessageServiceImpl extends AbstractService<UserMessage, Long> implements UserMessageService {

	private static final Logger log = LogManager.getLogger(UserMessageServiceImpl.class);

	@Autowired
	private UserMessageDao userMessageDao;
	
	@Override
	public UserMessage getUserMessage(Long id) {
		return this.userMessageDao.getUserMessage(id);
	}
}