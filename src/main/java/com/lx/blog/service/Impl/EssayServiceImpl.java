package com.lx.blog.service.Impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lx.blog.dao.EssayContentDao;
import com.lx.blog.dao.EssayDao;
import com.lx.blog.model.Essay;
import com.lx.blog.model.EssayContent;
import com.lx.blog.service.EssayService;
import com.lx.blog.util.JSONUtil;
import com.lx.blog.util.PageData;


@Service
public class EssayServiceImpl extends AbstractService<Essay, Long>implements EssayService {

	private static final Logger log = LogManager.getLogger(EssayServiceImpl.class);

	@Autowired
	private EssayDao essayDao;

	@Autowired
	private EssayContentDao essayContentDao;

	@Override
	public String getEssayListByUserId(Long userId,Integer currentPage) throws Exception {
		Long sizeOfAll = essayDao.getEssayCountByUserId(userId);
		PageData<Essay> pageData = new PageData<Essay>(currentPage);
		if(sizeOfAll>0){
			RowBounds rowBounds = new RowBounds(pageData.getOffset(currentPage),pageData.getPerPageNum());
			List<Essay> essayList = essayDao.getEssayListByUserId(userId,rowBounds);
			pageData.setData(sizeOfAll, essayList);
		}
		return JSONUtil.getEscapeJSONString(pageData);
	}

	@Override
	public String getEssayListByFlag(Integer flag, Integer currentPage) throws Exception {
		Long sizeOfAll = essayDao.getEssayCountByFlag(flag);
		PageData<Essay> pageData = new PageData<Essay>(currentPage);
		if(sizeOfAll>0){
			RowBounds rowBounds = new RowBounds(pageData.getOffset(currentPage),pageData.getPerPageNum());
			List<Essay> essayList = essayDao.getEssayListByFlag(flag,rowBounds);
			pageData.setData(sizeOfAll, essayList);
		}
		return JSONUtil.getEscapeJSONString(pageData);
	}
	
	@Override
	public Essay getEssayByUserIdAndId(Long userId, Long essayId) {
		Essay essay = essayDao.getEssayByUserIdAndId(userId, essayId);
		return essay;
	}

	@Override
	public Long saveEssay(Essay essay, String content) {
		Long essayId = essay.getId();
		EssayContent essayContent = new EssayContent();
		essayContent.setContent(content);
		if(essayId == null){
			essayDao.saveEssay(essay);
			essayContent.setEssayId(essay.getId());
			essayContentDao.saveEssayContent(essayContent);
		}else{
			essayDao.updateEssay(essay);
			essayContent.setEssayId(essayId);
			essayContentDao.updateEssayContent(essayContent);
		}
		return essayId;
	}

	@Override
	public void deleteEssay(Long id) {
		essayDao.deleteEssayById(id);
		essayContentDao.deleteEssayContentByEssayId(id);
	}

	@Override
	public Essay getEssayAndContent(Long id) {
		Essay essay = essayDao.getEssayById(id);
		EssayContent essayContent = essayContentDao.getEssayContentByEssayId(id);
		essay.setEssayContent(essayContent);
		return essay;
	}

}