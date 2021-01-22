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

	@Override
	public List<ActBean> searchKeyword(String keyword) {
		return actDao.searchKeyword(keyword);
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

	//經由會員ID查詢會於活動資料
	@Override
	public List<ActBean> getActRecords(Integer mb_ID) {
		return actDao.getActRecords(mb_ID);
	}

}
