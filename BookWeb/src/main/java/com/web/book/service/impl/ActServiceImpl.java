package com.web.book.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.book.dao.ActDao;
import com.web.book.model.ActBean;
import com.web.book.service.ActService;

@Service
@Transactional
public class ActServiceImpl implements ActService {

	@Autowired
	ActDao actDao;

	// 查詢所有活動
	@Override
	public List<ActBean> getAllActs() {
		return actDao.getAllActs();
	}

	// 依活動ID查詢活動
	@Override
	public ActBean getAct(Integer act_ID) {
		return actDao.getAct(act_ID);
	}

	// 新增活動
	@Override
	public int createAct(ActBean actbean) {
		return actDao.createAct(actbean);
	}

	// 修改活動
	@Override
	public int updateAct(ActBean ab) {
		return actDao.updateAct(ab);
	}

	// 刪除活動
	@Override
	public int deleteAct(Integer act_ID) {
		return actDao.deleteAct(act_ID);
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
