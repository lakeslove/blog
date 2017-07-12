package com.lx.blog.service;

import com.lx.blog.model.Essay;

public interface EssayService extends Service<Essay, Long>{
	String getEssayList(Long userId,Integer currentPage) throws Exception;
	Essay getEssayByUserIdAndId(Long userId, Long essayId);
	Long saveEssay(Essay essay, String essayContent);
	void deleteEssay(Long id);
}
