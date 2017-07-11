package com.lx.blog.service;

import com.lx.blog.model.Essay;

public interface EssayService extends Service<Essay, Long>{
	String getEssayList(Long userId,Integer currentPage) throws Exception;
}
