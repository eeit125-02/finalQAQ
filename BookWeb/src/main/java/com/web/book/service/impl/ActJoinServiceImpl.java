package com.web.book.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
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
	
	//經由報名ID取得單一報名資料
	public ActJoinBean getActJoin(Integer join_ID) {
		return actjoinDao.getActJoin(join_ID);
	}
		
	// 依會員ID取得會員報名紀錄
	@Override
	public List<ActJoinBean> getJoinRecords(Integer mb_ID) {
		return actjoinDao.getJoinRecords(mb_ID);
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
	
	@Override
	public boolean check(Integer mb_ID,Integer act_ID) {
		return actjoinDao.check(mb_ID, act_ID);
	}
	
	
}
