package com.lx.blog.service;

import com.lx.blog.model.EssayContent;

public interface EssayContentService extends Service<EssayContent, Long>{
	EssayContent getEssayContentByEssayId(Long essayId);
	void saveEssayContentByEssayId(Long essayId);
}
