package com.web.book.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.book.dao.ActJoinDao;
import com.web.book.model.ActJoinBean;
import com.web.book.service.ActJoinService;

@Service
@Transactional
public class ActJoinServiceImpl implements ActJoinService {

	@Autowired
	ActJoinDao actjoinDao;

	// 查詢所有活動
	@Override
	public List<ActJoinBean> getAllJoins() {
		return actjoinDao.getAllJoins();
	}

//	@Override
//	public List<ActJoinBean> searchJoinKeyword(String keyword) {
//		return actjoinDao.searchJoinKeyword(keyword);
//	}
	
	// 依活動ID查詢活動
	@Override
	public ActJoinBean getActJoin(Integer join_ID) {
		return actjoinDao.getActJoin(join_ID);
	}

	// 新增活動
	@Override
	public int createActJoin(ActJoinBean ajb) {
		return actjoinDao.createActJoin(ajb);
	}

	// 修改活動
	@Override
	public int updateActJoin(ActJoinBean ajb) {
		return actjoinDao.updateActJoin(ajb);
	}

	// 刪除活動
	@Override
	public int deleteActJoin(Integer join_ID) {
		return actjoinDao.deleteActJoin(join_ID);
	}

}
