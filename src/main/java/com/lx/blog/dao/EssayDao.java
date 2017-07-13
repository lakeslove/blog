package com.lx.blog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.lx.blog.model.Essay;

@Repository
public interface EssayDao {
	Long getEssayCountByUserId(Long userId);
	List<Essay> getEssayListByUserId(Long userId,RowBounds rowBounds);
	Long getEssayCountByFlag(Integer flag);
	List<Essay> getEssayListByFlag(Integer flag,RowBounds rowBounds);
	Essay getEssayByUserIdAndId(@Param("userId")Long userId,@Param("id")Long id);
	Long saveEssay(Essay essay);
	Long updateEssay(Essay essay);
	void deleteEssayById(Long id);
	Essay getEssayById(Long id);
}
