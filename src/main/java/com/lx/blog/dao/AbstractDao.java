package com.lx.blog.dao;

import java.io.Serializable;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@SuppressWarnings("unchecked")
public abstract class AbstractDao<T, ID extends Serializable> {
	private static final Logger log = LogManager.getLogger(AbstractDao.class);

}
