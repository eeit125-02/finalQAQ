package com.web.book.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.book.dao.ActDao;
import com.web.book.model.ActBean;
import com.web.book.model.ActJoinBean;
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

	// 依活動名稱關鍵字查詢活動
	@Override
	public ActBean getAct(String act_Name) {
		return actDao.getAct(act_Name);
	}

	// 新增活動
	@Override
	public void createAct(ActBean actbean) {
		actDao.createAct(actbean);
	}

	// 修改活動
	@Override
	public ActBean updateAct(ActBean actbean) {
		return actDao.updateAct(actbean);
	}

	// 刪除活動
	@Override
	public void deleteAct(Integer act_ID) {
		actDao.deleteAct(act_ID);
	}

	// 會員的報名活動清單
	@Override
	public List<ActJoinBean> getJoinRecords(Integer mb_ID) {
		return actDao.getJoinRecords(mb_ID);		
	}

	// 報名活動
	@Override
	public void createActReg(Integer act_ID, Integer mb_ID) {
		actDao.createActReg(act_ID,mb_ID);
	}

	// 取消報名活動
	@Override
	public void cancelJoinAct(Integer join_ID) {
		actDao.cancelJoinAct(join_ID);
	}

	// 修改報名資料
	@Override
	public ActJoinBean updateJoinAct(Integer mb_ID) {
		return actDao.updateJoinAct(mb_ID);
	}

}
