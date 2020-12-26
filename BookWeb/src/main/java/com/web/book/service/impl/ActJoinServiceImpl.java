package com.web.book.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.book.dao.ActDao;
import com.web.book.dao.ActJoinDao;
import com.web.book.model.ActBean;
import com.web.book.model.ActJoinBean;
import com.web.book.service.ActJoinService;
import com.web.book.service.ActService;

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



//	// 會員的報名活動清單
//	@Override
//	public List<ActJoinBean> getJoinRecords(Integer mb_ID) {
//		return actDao.getJoinRecords(mb_ID);		
//	}
//
//	// 報名活動
//	@Override
//	public void createActReg(Integer act_ID, Integer mb_ID) {
//		actDao.createActReg(act_ID,mb_ID);
//	}
//
//	// 取消報名活動
//	@Override
//	public void cancelJoinAct(Integer join_ID) {
//		actDao.cancelJoinAct(join_ID);
//	}
//
//	// 修改報名資料
//	@Override
//	public ActJoinBean updateJoinAct(Integer mb_ID) {
//		return actDao.updateJoinAct(mb_ID);
//	}

}
