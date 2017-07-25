package com.lx.blog.dao;

import org.springframework.stereotype.Repository;

import com.lx.blog.model.EssayContent;

@Repository
public interface EssayContentDao {
	EssayContent getEssayContentByEssayId(Long essayId);

	void saveEssayContent(EssayContent essayContent);

	void updateEssayContent(EssayContent essayContent);

	void deleteEssayContentByEssayId(Long essayId);
}
