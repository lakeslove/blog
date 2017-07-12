package com.lx.blog.service.Impl;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lx.blog.dao.EssayContentDao;
import com.lx.blog.model.EssayContent;
import com.lx.blog.service.EssayContentService;


@Service
public class EssayContentServiceImpl extends AbstractService<EssayContent, Long> implements EssayContentService {

	private static final Logger log = LogManager.getLogger(EssayContentServiceImpl.class);

	@Autowired
	private EssayContentDao essayContentDao;

	@Override
	public EssayContent getEssayContentByEssayId(Long essayId) {
		return essayContentDao.getEssayContentByEssayId(essayId);
	}

	@Override
	public void saveEssayContentByEssayId(Long essayId) {
		// TODO Auto-generated method stub
		
	}
	
	
	
}