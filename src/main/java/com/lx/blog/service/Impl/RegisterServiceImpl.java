package com.lx.blog.service.Impl;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lx.blog.dao.UserDao;
import com.lx.blog.model.User;
import com.lx.blog.service.RegisterService;
import com.lx.blog.util.PageData;


@Service
public class RegisterServiceImpl extends AbstractService<User, Long>implements RegisterService {

	private static final Logger log = LogManager.getLogger(RegisterServiceImpl.class);

	@Autowired
	private UserDao userDao;
	
	
}