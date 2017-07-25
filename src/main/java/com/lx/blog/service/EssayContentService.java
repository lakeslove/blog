package com.lx.blog.service;

import com.lx.blog.model.EssayContent;

public interface EssayContentService extends AbstractService<EssayContent, Long>{
	EssayContent getEssayContentByEssayId(Long essayId);
	void saveEssayContentByEssayId(Long essayId);
}
